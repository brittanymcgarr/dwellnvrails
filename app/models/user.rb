class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX = /(\(*(\d{3})\)|(\d{3}-)|(\d{3}))\s*(\d{3})-*(\d{4})/ 
    
    attr_accessor :remember_token, :activation_token
    before_save   :downcase_email
    before_create :create_activation_digest
    
    # Users must submit a non-empty string for name attribute
    validates(:name, presence: true, length: { maximum: 50 })
    
    # Must have valid email format, too
    validates(:email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false })
                    
    # Validate phone formats
    validates(:primary_phone, presence: true, length: {minimum: 10, maximum: 15}, format: { with: VALID_PHONE_REGEX })
                    
    # Ensure password hashing
    has_secure_password
    
    # Password string should have a minimum length of 6
    validates(:password, presence: true, length: { minimum: 6 }, allow_nil: true)
    
    # Returns the hash digest of the given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
                                                  
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Creates the random remember digest token
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    # Saves the digested token
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # Returns true if the given token matches the digest
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
    
    # Resets the remember digest to allow logout on cookie'd users
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    # Activates an account
    def activate
      update_attribute(:activated, true)
      update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email
    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end
    
    private
    
    # lowercase letter conversion for emails
    def downcase_email
      self.email = email.downcase
    end
    
    # Create the activation token when new user applies
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
end
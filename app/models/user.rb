class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX = /(\(*(\d{3})\)|(\d{3}-)|(\d{3}))\s*(\d{3})-*(\d{4})/ 
    
    attr_accessor :remember_token
    
    # Convert the emails to lowercase
    before_save { self.email = email.downcase }
    
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
    def authenticated?(remember_token)
        if(remember_digest.nil?)
            return false
        end
        
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    # Resets the remember digest to allow logout on cookie'd users
    def forget
        update_attribute(:remember_digest, nil)
    end
    
end
class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    # Conver the emails to lowercase
    before_save { self.email = email.downcase }
    
    # Users must submit a non-empty string for name attribute
    validates(:name, presence: true, length: { maximum: 50 })
    
    # Must have valid email format, too
    validates(:email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false })
                    
    # Ensure password hashing
    has_secure_password
    
    # Password string should have a minimum length of 6
    validates(:password, presence: true, length: { minimum: 6 })
    
    # Returns the hash digest of the given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
                                                  
        BCrypt::Password.create(string, cost: cost)
    end
    
end
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
    
    # Password string should have a minimum length of 8
    validates(:password, presence: true, length: { minimum: 6 })
    
end
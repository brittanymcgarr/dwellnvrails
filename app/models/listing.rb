class Listing < ApplicationRecord
    VALID_PHONE_REGEX = /(\(*(\d{3})\)|(\d{3}-)|(\d{3}))\s*(\d{3})-*(\d{4})/
    VALID_ZIP_REGEX = /\d{5}((-)?\d{4})?/

    # One use has many listings
    belongs_to :user
    
    # Descending order from newest to oldest as default
    default_scope -> { order(created_at: :desc) }
    
    # Carrier Wave mount uploader for images
    mount_uploader :picture, PictureUploader
    
    # Validation of parameters before accepting listing
    validates :user_id, presence: true
    validates :description, presence: true
    validates :street_address, presence: true
    validates :city, presence: true, length: { maximum: 30 }
    validates :zip_code, presence: true, length: {minimum: 5, maximum: 10}, format: { with: VALID_ZIP_REGEX }
    validates :primary_contact, presence: true, length: {minimum: 10, maximum: 15}, format: { with: VALID_PHONE_REGEX }
    
  
end

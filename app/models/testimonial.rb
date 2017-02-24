class Testimonial < ApplicationRecord
    mount_uploader :image, TestimonialsUploader
end

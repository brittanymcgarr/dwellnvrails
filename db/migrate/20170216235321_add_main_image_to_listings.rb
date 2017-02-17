class AddMainImageToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :main_image, :string
  end
end

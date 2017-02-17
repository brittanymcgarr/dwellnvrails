class AddPictureToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :picture, :string
  end
end

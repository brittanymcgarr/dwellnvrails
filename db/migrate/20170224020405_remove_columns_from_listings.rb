class RemoveColumnsFromListings < ActiveRecord::Migration[5.0]

  def change
    remove_column :listings, :main_image
    remove_column :listings, :image_1
    remove_column :listings, :image_2
    remove_column :listings, :image_3
    remove_column :listings, :image_4
    remove_column :listings, :image_5
    remove_column :listings, :image_6
    remove_column :listings, :image_7
    remove_column :listings, :image_8
    remove_column :listings, :image_9
    remove_column :listings, :image_10
    remove_column :listings, :image_11
  end

end

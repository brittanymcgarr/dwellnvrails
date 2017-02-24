class RemoveColumnsFromListings < ActiveRecord::Migration[5.0]

  def change
    remove_column :listings, :main_image
  end

end

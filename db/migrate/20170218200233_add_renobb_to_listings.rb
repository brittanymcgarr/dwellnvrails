class AddRenobbToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :renobb, :boolean, default: false
  end
end

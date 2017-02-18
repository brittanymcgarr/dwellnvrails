class AddAskingPriceToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :asking_price, :integer
  end
end

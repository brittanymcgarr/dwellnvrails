class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :primary_contact
      t.string :secondary_contact
      t.string :listing_status
      t.references :user, foreign_key: true

      t.timestamps
    end
    
    # Create the link between the owner and the listing
    add_index :listings, [:user_id, :created_at]
    
  end
end

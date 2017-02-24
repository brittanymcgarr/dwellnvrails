class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end

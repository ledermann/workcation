class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :location, null: false
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :beds, null: false
      t.integer :baths, null: false
      t.integer :price, null: false
      t.integer :review_count, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end

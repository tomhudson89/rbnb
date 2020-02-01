class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :guests
      t.integer :bedrooms
      t.integer :beds
      t.text :description
      t.integer :price_per_night
      t.string :title

      t.timestamps
    end
  end
end

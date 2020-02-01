class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.string :start
      t.date :date
      t.string :end
      t.date :date

      t.timestamps
    end
  end
end

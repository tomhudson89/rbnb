class RemoveDateFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date, :date
    remove_column :bookings, :start, :string
    remove_column :bookings, :end, :string
  end
end

class DeleteColumnsinbookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start
    remove_column :bookings, :end
    remove_column :bookings, :date
  end
end

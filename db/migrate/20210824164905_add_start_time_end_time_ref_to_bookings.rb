class AddStartTimeEndTimeRefToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :start_time, :integer
    add_column :bookings, :end_time, :integer
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :teacher, foreign_key: true
  end
end

class ChangeBookingTimesToTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_table :bookings do |t|
      t.remove :start_time
      t.remove :end_time
    end

    change_table :bookings do |t|
      t.timestamp :start_time, null: false
      t.timestamp :end_time, null: false
    end
  end
end

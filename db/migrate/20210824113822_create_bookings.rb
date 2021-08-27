class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|

      t.timestamps
    end
  end
end

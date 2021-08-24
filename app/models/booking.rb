class Booking < ApplicationRecord
  has_one :user
  has_one :teacher

  validates :start_time, :end_time, presence: true
end

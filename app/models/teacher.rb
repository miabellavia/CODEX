class Teacher < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  CATEGORIES = ["Front-End Specialist", "Back-End Specialist", "Full Stack Specialist"]
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, inclusion: { in: CATEGORIES }
end

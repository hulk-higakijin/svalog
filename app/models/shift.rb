class Shift < ApplicationRecord
  belongs_to :user

  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :break_time, presence: true,  length: { maximum: 1440 }
  validates :hourly_wage, presence: true, length: { in: 800..15_000 }
  validates :date, presence: true
end

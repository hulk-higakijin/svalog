class Shift < ApplicationRecord
  belongs_to :user

  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :break_time, presence: true,  length: { maximum: 1440 }
  validates :hourly_wage, presence: true, numericality: { in: 800..15_000 }
  validates :date, presence: true
  validate :must_be_same_day

  before_create :ensure_start_at_and_finish_at_are_different_times
  before_update :delete_if_start_at_and_finish_at_are_same_times

  private

    def must_be_same_day
      errors.add('開始時刻と終了時刻は日付と同じ日にしてください') unless start_at.to_date == finish_at.to_date || start_at.to_date == date
    end

    def ensure_start_at_and_finish_at_are_different_times
      throw(:abort) if start_at == finish_at
    end

    def delete_if_start_at_and_finish_at_are_same_times
      destroy if start_at == finish_at
    end
end

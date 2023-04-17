class Company < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :address, length: { maximum: 50 }
end

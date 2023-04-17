class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { worker: 0, manager: 1, admin: 2 }

  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
end

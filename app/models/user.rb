class User < ApplicationRecord
  has_and_belongs_to_many :events
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, :surname, length: { in: 2..50 }, format: { with: /\A[a-zA-Z]+\z/ }, on: :update
end

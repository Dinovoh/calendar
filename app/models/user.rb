class User < ApplicationRecord
  has_many :relations
  has_many :events, through: :relations

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, :surname, length: { in: 2..50 }, format: { with: /\A[a-zA-Z]+\z/ }, on: :update
end

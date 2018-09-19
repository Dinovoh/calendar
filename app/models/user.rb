class User < ApplicationRecord
  has_and_belongs_to_many :events
  has_many :events, class_name: :Event, foreign_key: :creator_id
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, :surname, length: { in: 2..50 }, format: { with: /\A[a-zA-Z]+\z/ }, on: :update
end

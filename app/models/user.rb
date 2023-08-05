# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :user_votes
  has_many :feedbacks
  has_many :voting_events

  validates :userName, uniqueness: true, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 }
end

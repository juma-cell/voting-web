class VotingEvent < ApplicationRecord
  belongs_to :user
  has_many :candidates
  has_many :user_votes

  validates :event_Name, presence: true, length: { maximum: 255 }
  validates :event_Description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
end

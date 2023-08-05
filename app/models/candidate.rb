class Candidate < ApplicationRecord
  belongs_to :user_vote
  belongs_to :voting_event

  validates :role, presence: true, length: { maximum: 255 }
  validates :userName, presence: true, length: { maximum: 255 }
end
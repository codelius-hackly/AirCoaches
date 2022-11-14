class CoachingOffer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :description, length: { minimum: 30 }
  validates :price, presence: true
  validates :user, presence: true
  validates :skill, inclusion: { in: ["Ruby", "Rails", "JavaScript", "HTML/CSS", "FrontEnd", "BackEnd"] }
end

class Booking < ApplicationRecord
  belongs_to :coaching_offer
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :datetime, presence: true
  # validates :datetime TO BE only possible for "tomorrow"
  validates :duration, presence: true
  validates :status, inclusion: { in: ["pending", "accepted", "rejected"] }

end

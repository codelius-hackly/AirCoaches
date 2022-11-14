class Booking < ApplicationRecord
  belongs_to :coaching_offer
  belongs_to :user

  validates :datetime, presence: true
  # validates :datetime TO BE only possible for "tomorrow"
end

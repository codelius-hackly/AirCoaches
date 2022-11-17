class CoachingOffer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_description_skill,
  against: [ :title, :description, :skill ],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :description, length: { minimum: 30 }
  validates :price, presence: true
  validates :user, presence: true
  validates :skill, inclusion: { in: ["Ruby", "Rails", "JavaScript", "HTML", "CSS", "FrontEnd", "BackEnd", "Python", "PHP"] }

  def average_rating
   offer_reviews.average(:rating)
  end

  def offer_reviews
     bookings.extract_associated(:reviews).first
  end
end

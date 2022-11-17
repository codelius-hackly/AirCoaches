class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @bookings = Booking.all
    # TODO: make another selection of offers to show on homepage
    @coaching_offers = CoachingOffer.where(rating: (4..5))
  end
end

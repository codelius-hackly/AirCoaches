class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @bookings = Booking.all
    @coaching_offers = CoachingOffer.all
  end
end

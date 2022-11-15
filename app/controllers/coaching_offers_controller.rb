class CoachingOffersController < ApplicationController
  def new
    @offer = CoachingOffer.new
  end
end

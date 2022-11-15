class CoachingOfferController < ApplicationController

  def show
    @coaching_offer = CoachingOffer.find(params[:id])
  end

end

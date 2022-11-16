class CoachingOffersController < ApplicationController
  def show
    @coaching_offer = CoachingOffer.find(params[:id])
  end

  def new
    @coaching_offer = CoachingOffer.new
  end

  def create
    @coaching_offer = CoachingOffer.new(coaching_offer_params)
    @coaching_offer.user = current_user
    if @coaching_offer.save
      redirect_to coaching_offer_path(@coaching_offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def coaching_offer_params
    params.require(:coaching_offer).permit(:skill, :description, :price)
  end
end
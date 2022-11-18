class CoachingOffersController < ApplicationController
  def index
    query = params[:query]
    if query.present?
      @coaching_offers = CoachingOffer.search_by_title_description_skill(query)
    else
      @coaching_offers = CoachingOffer.all
    end
  end

  def show
    @coaching_offer = CoachingOffer.find(params[:id])
    @coaching_offers = CoachingOffer.where(user: @coaching_offer.user).excluding(@coaching_offer)
    @booking = Booking.new
    @offer_reviews = @coaching_offer.reviews
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
    params.require(:coaching_offer).permit(:skill, :description, :price, :title, :rating)
  end
end

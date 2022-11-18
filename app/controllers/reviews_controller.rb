class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @coaching_offer = @booking.coaching_offer
    @review = Review.new
    # render "reviews/new", status: :unprcessable_entity
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      flash[:notice] = "Review created successfully"
      redirect_to booking_path(@booking)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end

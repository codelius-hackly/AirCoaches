class BookingsController < ApplicationController

  # before_action :set_booking

  #read

  def index
    @bookings = Bookings.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  #create
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @coaching_offer = CoachingOffer.find(params[:coaching_offer_id])
    @booking.coaching_offer = @coaching_offer
    if @booking.save
      redirect_to booking_path(@booking), notice: "yeaaaayyyyyy"
    else
      render "coaching_offers/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:datetime, :duration, :comment)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end

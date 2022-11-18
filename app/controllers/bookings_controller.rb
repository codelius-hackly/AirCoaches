class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy, :status]

  #read

  def index
    @bookings = Bookings.all
  end

  def show
  end

  #create
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @coaching_offer = CoachingOffer.find(params[:coaching_offer_id])
    @booking.coaching_offer = @coaching_offer
    if @booking.save
      redirect_to booking_path(@booking), notice: "Yeaaaayyyyyy"
    else
      render "coaching_offers/show", status: :unprocessable_entity
    end
  end

  #update
  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path(@booking)
  end

  #delete
  def destroy
    @booking.destroy
    redirect_to dashboard_url, notice: "The booking was deleted."
  end

  def status
    @booking.status = params[:status]
    @booking.save
    redirect_to dashboard_path
  end


  private

  def booking_params
    params.require(:booking).permit(:datetime, :duration, :comment)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end

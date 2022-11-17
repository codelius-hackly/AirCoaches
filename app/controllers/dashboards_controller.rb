class DashboardsController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
  end
end

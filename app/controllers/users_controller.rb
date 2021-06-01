class UsersController < ApplicationController
  # def new
  # end


  # def create
  # end

  def show
    @bookings = Booking.where(user: current_user)
    @watches = current_user.watches
  end
  

  # private

  # def user_params
  # end
end

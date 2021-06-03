class BookingsController < ApplicationController
  def new
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    # @booking.user = current_user
    @booking.watch_id = params[:watch_id]
      if @booking.save
        redirect_to user_path(current_user.id)   # redirects to the user show page - shows all their bookings etc
      else
        render :new
      end
  end

  def destroy
    @booking = Booking.find(params[:watch_id])
    @booking.destroy
    redirect_to user_path
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end


# build delete route
# build destroy action in booking controller
# user/show page delete button
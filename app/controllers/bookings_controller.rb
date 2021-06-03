class BookingsController < ApplicationController
  def new
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @watch = Watch.find(params[:watch_id])
    @booking.watch_id = params[:watch_id]
    price = (@booking.end_date - @booking.start_date)
    @booking.total_price = price.to_i * @watch.price

    if @booking.total_price > 0 && @booking.save
      redirect_to user_path(current_user.id)   # redirects to the user show page - shows all their bookings etc
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

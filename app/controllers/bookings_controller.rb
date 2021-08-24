class BookingsController < ApplicationController
  # before_action :set_user, only: [:create, :show]

  # def new
  #   @booking = Booking.new
  # end

  # def create
  #   @booking = Booking.new(booking_params)
  #   if @booking.save
  #     redirect_to booking_path(@booking)
  #   else
  #     render :new
  #   end
  # end

  # def show
  #   @bookings = @user.bookings
  # end

  # private

  # def set_user
  #   @user = User.find(params[:user_id]
  # end

  # def booking_params
  #   params.require(:booking).permit(:start_time, :end_time, :teacher_id)
  # end
end

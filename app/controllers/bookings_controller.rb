class BookingsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :destroy]

  def index
    @bookings = Booking.where(user: @user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: 'You created a new Booking!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking), notice: 'The booking is updated.'
  end

  private

  def set_user
    @user = User.find(params[:user_id]
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :teacher_id)
  end
end

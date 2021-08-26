class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings #.where('start_time >= ?', Time.current)
    if @bookings.empty?
      redirect_to teachers_path, notice: 'You do not have any bookings yet.'
    else
      @bookings
    end

    # if params[:start_time]
    #   @bookings = @bookings.where('start_time >= ?', params[:start_time])
    # end
  end

  def show
    @booking = current_user.bookings.find(params[:id])
    # @teacher = Teacher.find(params[:teacher_id])
    # @booking.teacher = @teacher
  end

  def destroy
    current_user.bookings.find(params[:id]).destroy
    redirect_to bookings_path
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @booking = @teacher.bookings.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.teacher = @teacher
    if @booking.save
      redirect_to teacher_dashboard_path(current_user), notice: 'You created a new Booking!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to teacher_dashboard_path(current_user), notice: 'The booking is updated.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end

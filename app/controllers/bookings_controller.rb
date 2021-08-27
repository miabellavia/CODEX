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
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to teacher_dashboard_path(current_user)
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
      redirect_to teacher_dashboard_path(current_user), alert: 'You created a new Booking! Your Teacher will contact you as soon as they have accepted your booking'
    else
      render :new
    end
  end

  def edit
    @booking = current_user.bookings.find(params[:id])
  end

  def update
    @booking = current_user.bookings[0].find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to teacher_dashboard_path(current_user), notice: 'The booking is updated.'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end

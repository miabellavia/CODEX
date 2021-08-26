class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user
    if @teacher.save
      redirect_to teacher_path(@teacher), notice: 'Your teacher profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher), notice: 'Your teacher profile was successfully updated.'
    else
      render :edit
    end
  end

  def dashboard
    @user = current_user
    @bookings = Booking.all
    @teacher = Teacher.find(params[:teacher_id])
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def destroy
    @teacher.destroy
    redirect_to root_path, notice: 'You have successfully deleted your teacher profile.'
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:description, :category, :price)
  end
end

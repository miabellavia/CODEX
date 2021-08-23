class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Your account is successfully created!'
    else
      render :new, notice: 'Please try again...'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at, :first_name, :last_name)
  end
end

class Api::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render json: @user
    else
      render json:  @user.errors.full_messages, status: 401
    end
  end

  def user_params
    params.require(:user).permit(:password, :email, :fname, :lname)
  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Account created.'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:success] = 'Profile updated.'
      redirect_to root_path
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end


end
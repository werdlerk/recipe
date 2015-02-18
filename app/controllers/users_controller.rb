class UsersController < ApplicationController
  before_action :require_logged_in, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = t('users.flash.account_created')
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
      flash[:success] = t('users.flash.profile_updated')
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
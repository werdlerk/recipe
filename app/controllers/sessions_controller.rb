class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = t('sessions.flash.welcome_back')
    else
      flash[:danger] = t('sessions.flash.authentication_failure')
    end

    if request.referrer
      redirect_to request.referrer
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = t('sessions.flash.destroy')

    if request.referrer
      redirect_to request.referrer
    else
      redirect_to root_path
    end
  end

end
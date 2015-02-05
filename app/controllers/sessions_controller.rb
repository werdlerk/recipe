class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back!"
    else
      flash[:danger] = "Incorrect username or password"
    end

    if request.referrer
      redirect_to request.referrer
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Bye bye, you've logged out!"

    if request.referrer
      redirect_to request.referrer
    else
      redirect_to root_path
    end
  end

end
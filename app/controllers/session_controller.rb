class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Succesful login, welcome back"
      # Redirects to the intended url or the root path
      redirect_to(session[:intended_url] || user_path(user))
      session[:intended_url] = nil
    else
      flash.now[:error] = "Email or password incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end


end

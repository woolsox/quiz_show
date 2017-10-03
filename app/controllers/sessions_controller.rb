class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
     if user && user.authenticate(params[:session][:password])
      log_in user
      render 'test'
     else
      p 'failed'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    reset_session
  end

end

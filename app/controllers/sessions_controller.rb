class SessionsController < ApplicationController
  skip_before_action :check_authorization, only: [:new, :create, :destroy]

  def new
    render :login
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:notice] = "Invalid username or password!"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to home_path
  end
end

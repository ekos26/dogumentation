class ApplicationController < ActionController::Base
  before_action :check_authorization
  helper_method :current_session_user

  def current_session_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_session_user ? true : false
  end

  def check_authorization
    redirect_to home_path unless logged_in?
  end
end

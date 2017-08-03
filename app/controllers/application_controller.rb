class ApplicationController < ActionController::Base

  helper_method :current_user

  def authenticate
    # redirect_to :connect_to_strava unless user_signed_in?
    @current_user = get_current_user()
  end

  def get_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    # converts current_user to a boolean by negating the negation
    !!get_current_user
  end

end

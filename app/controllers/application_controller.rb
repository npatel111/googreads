class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # byebug
    # User.find(session[:user_id]) || nil
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def logged_in?
    byebug
    current_user.id != nil
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to login_path
    end
  end

end

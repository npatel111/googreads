class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user = User.find(session[:user_id])
  end

  def logged_in?
    current_user.id != nil
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to login_path
    end
  end

end

class WelcomeController < ApplicationController

  # before_action :require_login

  def hello
    # byebug
    @current_user  = current_user
    # byebug
  end

end

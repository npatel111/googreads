class WelcomeController < ApplicationController

  before_action :require_login

  def hello
    @current_user  = current_user
  end

end

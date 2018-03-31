class SessionsController < ApplicationController
  attr_accessor :user
  def new

  end

  def create
    # debugger
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
      # @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end

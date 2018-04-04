class SessionsController < ApplicationController
  attr_accessor :user
  def new
    @user = User.new
  end

  def create
    # debugger
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      # @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    # byebug
    session.delete :user_id
    redirect_to root_path
  end

end

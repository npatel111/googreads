class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
      #or render :new
    end
  end

  def destroy
    session.delete :user_id
    # byebug
    redirect_to login_path
  end

end
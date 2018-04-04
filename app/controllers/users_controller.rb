class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = "there was an error"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    if session["user_id"] && @user == current_user
      render :show
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      session.delete :user_id
      @user.destroy
    end
    redirect_to root_path
  end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end

end

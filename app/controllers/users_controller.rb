class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params["user"]["name"], password: params["user"]["password"])
    byebug
    if @user.authenticate(params["user"]["password"]) && params["user"]["password"] == params["user"]["password_confirmation"]
      @user.save
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to root_path
    else
      # redirect_to new_user_path
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])

  end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end

end

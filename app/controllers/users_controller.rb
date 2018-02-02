class UsersController < ApplicationController

  before_action :users, only: [:index, :create]
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to users_path(@users)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def users
      @users = User.all
    end

end

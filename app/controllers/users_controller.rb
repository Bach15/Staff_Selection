class UsersController < ApplicationController

  before_action :users, only: [:index, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    redirect_to users_path(@users)
    print "nice" if user.save
  end

  def show
  end

  def update
    @user.assign_attributes user_params
    if @user.save
      redirect_to users_path(@users)
    else
      render :edit
    end  
  end 

  def destroy
    @user.destroy
    redirect_to users_path(@users)
  end 

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def users
      @users = User.all
    end

    def set_user
      @user = User.find(params[:id])
    end  

end

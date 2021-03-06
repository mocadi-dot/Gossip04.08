class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #puts @user.city.id
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  #  @city = City.all.order(:name)
  end

  def create
    @user = User.new(user_params)
  #  @user.city_id = City.all.sample.id #.id à la fin ne fonctionne pas
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
   end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :city_id, :password, :password_confirmation, :description)
  end

end

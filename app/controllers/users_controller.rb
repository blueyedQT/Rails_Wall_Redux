class UsersController < ApplicationController
  def index
  end

  def new
  	@errors = flash[:errors]
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		sign_in @user
  		redirect_to @user
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to root_path
  	end

  end

  def show
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

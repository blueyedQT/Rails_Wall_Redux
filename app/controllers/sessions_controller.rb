class SessionsController < ApplicationController
  def index
  	@user = current_user
  	puts @user
  end

  def new
  end

   def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	puts user
  	if user.nil?
  		flash[:error] = "The email and password combination do not exist"
  		redirect_to root_path
  	else
  		sign_in user
  		redirect_to posts_path
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end

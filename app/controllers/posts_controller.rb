class PostsController < ApplicationController
  def index
  end

  def new
  	@post = Post.new
  	@posts = Post.all
  end

  def create
  	params[:post][:user_id] = session[:user_id]
  	@post = Post.create(post_params)
  	if @post.save
  	else 
  		flash[:errors] = @post.errors.full_messages
  	end
  	redirect_to '/posts/new'
  end

  def show
  end

  def post_params
  	params.require(:post).permit(:message, :user_id)
  end
end

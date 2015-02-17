class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.create(message:params[:comment][:message], user:current_user, post:Post.find(params[:comment][:post]))
  	if @comment.save
  		redirect_to posts_path
  	else
  		flash[:errors] = @comment.errors.full_messages
  		redirect_to posts_path
  	end
  end

  private
  def comment_params
  	params.require(:comment).permit(:post, :user, :message)
  end
end

class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new
  end
end

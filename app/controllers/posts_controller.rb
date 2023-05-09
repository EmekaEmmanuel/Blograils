class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @users = User.find(params[:id])
    # @posts = @users.posts
  end

  def show
    @posts = Post.find(params[:id])
  end
end

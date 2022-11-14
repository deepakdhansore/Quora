class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@user,@post)
    else
      render 'new'
    end
  end


  private
    
    def post_params
      params.require(:post).permit(:author,:body,:published_at)
    end
end

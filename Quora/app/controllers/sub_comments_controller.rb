class SubCommentsController < ApplicationController
    
    def new
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:comment_id])
        @reply = @comment.sub_comments.new

    end

    
    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:comment_id])
        @reply = @comment.comments.build(comment_params)
        if @comment.save
         redirect_to user_post_path(@user,@post)
        else
         render 'posts/show'
        end
    end
    
    private
    def comment_params
      params.require(:comment).permit(:author, :body)
    end

end

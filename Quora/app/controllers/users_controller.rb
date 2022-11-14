class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create 
     @user = User.new(user_params)
     if @user.save
      redirect_to new_user_post_path(@user)
     else
      render 'new'
     end
  end


  private
    
    def user_params
      params.require(:user).permit(:email,:first_name,:last_name,:password)
    end
end

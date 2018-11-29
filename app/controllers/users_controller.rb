class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    
    if params[:name] && params[:name].length > 2
      @name = params[:name]
      @users = User.where('name LIKE ?', "%#{@name}%")

      if @users.empty?
        @error_message = "No results-- displaying all users instead."
        @users = User.all
      end
    elsif params[:name] && params[:name].length < 3
      @error_message = "Name needs to be more than 2 letters-- displaying all users instead."
      @users = User.all
    else
      @users = User.all
    end
  end
        
  
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end

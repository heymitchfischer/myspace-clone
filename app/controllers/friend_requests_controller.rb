class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all
  end

  def create
    p params 
      friend = User.find(params[:id])
      p friend
      # @friend_request = current_user.friend_requests.new(friend: friend)
      @friend_request = FriendRequest.create(user_id: current_user.id, friend_id: friend.id)


        flash[:notice] = "Friend request sent!"

      redirect_to("/")
  end

  def destroy
    @friend_requests = FriendRequest.destroy.find(params[:id]).destroy
  end

  def show
    @friend_request = FriendRequest.find(params[:id])
  end


end

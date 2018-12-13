class FriendRequestsController < ApplicationController
  def index
    @pending_friend_requests = FriendRequest.where(friend: current_user)
  end

  def create
    friend = User.find(params[:id])
    @friend_request = FriendRequest.new(user_id: current_user.id, friend_id: friend.id)

    if @friend_request.save
      flash[:success] = "Friend request sent!"
      redirect_to("/users")
    end
  end

  def destroy
    friend_request = FriendRequest.find(params[:id])
    friend_request.destroy
    flash[:notice] = "Friend request deleted."
    redirect_to("/friend_requests")
  end
end

class FriendshipsController < ApplicationController
  def create
    request = FriendRequest.find(params[:request_id])
    friend = User.find(request.user_id)
    friendship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
    if friendship.save
      Friendship.create(user_id: friend.id, friend_id: current_user.id)
      request.destroy
      flash[:success] = "You're now friends with #{friend.name}!"
      redirect_to "/friend_requests"
    end
  end

  def destroy
    friend = User.find(params[:friend_id])
    friendship = Friendship.find_by(user_id: current_user.id, friend_id: friend.id)
    inverse_friendship = Friendship.find_by(user_id: friend.id, friend_id: current_user.id)

    if friendship.destroy
      inverse_friendship.destroy
      flash[:success] = "You ended your friendship with #{friend.name}!"
      redirect_to "/users/#{current_user.id}"
    end
  end
end

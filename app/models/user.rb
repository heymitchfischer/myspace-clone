class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :friend_requests
  has_many :friendships
  has_many :friends, through: :friendships

  def friend_circle_includes?(user)
    return friends.include?(user)
  end

  def needs_a_response?(user)
    return FriendRequest.where(user_id: user.id, friend_id: id).any?
  end

  def invite_already_sent?(user)
    return FriendRequest.where(user_id: id, friend_id: user.id).any?
  end
end

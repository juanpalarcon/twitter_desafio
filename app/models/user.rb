class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friends

  has_many :added_friends, :class_name => 'Friend', :foreign_key => 'user_id'
  has_many :followers, :class_name => 'Friend', :foreign_key => 'friend_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  def get_name
    self.name
  end

  def get_user_photo
    self.user_photo
  end

  def self.add_friends(x)
    if x
      @my_friends = Friend.where(user_id: x.id)
      friend_id_array = []
      @my_friends.each do |my_friend|
        friend_id_array << my_friend.friend_id
      end
      self.where.not(id: friend_id_array)
    end
  end
end



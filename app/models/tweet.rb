class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id", dependent: :destroy
    validates :content, presence: true

    scope :tweets_for_me, ->(users_list) { where(
        user_id: users_list.map do |friend|
            friend.friend_id 
        end ) }

    def retweet_ref
        Tweet.find(self.rt_ref)
    end

    def get_name
        self.name
      end
end

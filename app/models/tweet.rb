class Tweet < ApplicationRecord
    include ActionView::Helpers::UrlHelper
    has_many :tweet_hash_tags
    has_many :hash_tags, through: :tweet_hash_tags
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id"
    belongs_to :parent_tweet, class_name: "Tweet", optional: true
    validates :content, presence: true



    def self.tweets_for_me(x)
        @my_friends = Friend.where(user_id: x.id)
        friend_id_array = []
        @my_friends.each do |my_friend|
            friend_id_array << my_friend.friend_id
        end
        self.where(user_id: friend_id_array)    
    end

    
    def retweet_ref
        Tweet.find(self.rt_ref)
    end







end

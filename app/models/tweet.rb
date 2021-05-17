class Tweet < ApplicationRecord
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
    # def content
    #     if source_tweet
    #       source_tweet.content
    #     else
    #       super
    #     end
    #   end
      
    #   def content=(content)
    #     if source_tweet
    #       raise 'retweets cannot have content'
    #     else
    #       super
    #     end
    #   end


end

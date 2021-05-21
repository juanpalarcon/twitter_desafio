class Tweet < ApplicationRecord
    include ActionView::Helpers::UrlHelper
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

    before_save :hashtag
    def hashtag
        new_array = []
        self.content.split(" ").each do |word| 
            if word.start_with?("#") 
                word_parsed = word.sub '#',''
                word = link_to(word,Rails.application.routes.url_helpers.root_path+"?q="+word_parsed)
            end
                new_array.push(word)
        end
            self.content = new_array.join(" ")   
            
    end


end

class LikesController < ApplicationController

  before_action :find_tweet



  def create
    if user_signed_in?
        @tweet.likes.create(user_id: current_user.id)        
    end
    redirect_to root_path
end

  private
  def find_tweet
      @tweet = Tweet.find(params[:tweet_id])
  end
end


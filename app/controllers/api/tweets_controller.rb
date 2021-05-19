class Api::TweetsController < ApplicationController
    before_action :set_tweet, only: [:show, :update, :destroy]
    http_basic_authenticate_with name: "juanpablo", password: "juanpablo"
    # http_basic_authenticate_with :current_user


    def index
      @tweets = Tweet.all
      render json: @tweets
    end

    def dates
        fecha_1 = params[:fecha1]
        fecha_2 = params[:fecha2]
        @tweets = Tweet.where(:created_at => fecha_1..fecha_2)
        render json: @tweets
    end

    def show
    end
  
    def create
      @tweet = Tweet.new(user_params)
  
      if @tweet.save
        render json: @tweet, status: :created
      else
        render json: @tweet.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @tweet.update(user_params)
        render json: @tweet, status: :ok
      else
        render json: @tweet.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @tweet.destroy
      head :no_content
    end
  
    private
      def set_tweet
        @tweet = Tweet.find(params[:id])
      end
  
      def user_tweet
        params.require(:tweet).permit(:email, :password, :user_name, :tweet, :likes )
      end

end

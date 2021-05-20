class Api::TweetsController < ApplicationController
    before_action :set_tweet, only: [:show, :update, :destroy]
    http_basic_authenticate_with name: "juanpablo", password: "juanpablo"
    # http_basic_authenticate_with :current_user


    def index
        if request.headers['X-API-KEY'].present? && User.find_by(api_key: request.headers['X-API-KEY'])
            @tweets = Tweet.all.order("created_at DESC").limit(50)

            render json: @tweets
        else
            return render json: {mensaje:"falta colocar key = X-API-KEY o registrar al usuario"}
        end
    end

    def dates
        fecha_1 = params[:fecha1]
        fecha_2 = params[:fecha2]
        @tweets = Tweet.where(:created_at => fecha_1..fecha_2)
        render json: @tweets
    end

    def show
        user = request.headers['X-CLIENTE']
        Request.create(user: user)
    
        if @unit
          render json: @unit
        else
          render json: {message: 'UF no ha sido encontrada'}
        end
    end
  
    def create
        if request.headers['X-API-KEY'].present? && User.find_by(api_key: request.headers['X-API-KEY'])

            @tweet = Tweet.new(tweet_params)

            if @tweet.save
                render json: @tweet, status: :created, location: @tweet
            else
                render json: @tweet.errors, status: :unprocessable_entity
            end

        else 
            return render json: {mensaje:"falta colocar key = X-API-KEY o registrar al usuario"}
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
        params.require(:tweet).permit(:email, :password, :user_name, :tweet, :user_id, :tweet_id, :content )
      end

end

class FriendsController < ApplicationController
    before_action :find_user


    def index
        @q = Tweet.ransack(params[:q])
        @tweet = Tweet.new
        if signed_in?
            @tweets = @q.result(distinct: true).order('created_at DESC').page(params[:page]).per(50)  
            
        else
            redirect_to root_path, notice: "you must log in"
        end
    end

    def create
        @friend = Friend.create(user_id: current_user.id, friend_id: params[:user_id])
        redirect_to root_path
    end

    def follow
        @followed = User.find(params[:id])
        @friend = Friend.new(user_id: current_user.id, friend_id: @followed.id)
        @friend.save
        redirect_to root_path, notice: "Ahora sigues a #{@followed.user_name}"
    end
    def unfollow

        friend = Friend.find_by(friend_id: params[:id], user_id: current_user)
        friend.destroy 
        redirect_to root_path, notice: "Ya no sigues a este usuario"

    end

    private
    def set_user
        @user = User.find(current_user.id)
    end

    def find_user
        @user = User.find(current_user.id)
    end

end
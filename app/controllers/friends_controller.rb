class AddFriends < ApplicationController
    before_action :set_user
    before_action :set_friend, only: [:destroy]

    def create
        @friend = current_user.friends.create(friend_id: @user.id)
        respond_to do |format|
            if @friend.save
              format.html { redirect_to root_path, notice: "Friends fue agregado!." }
            else
            redirect_to root_path
            end
        end
    end

    def destroy
        if already_follow?
            @friend.destroy
            redirect_to root_path
        end
    end

    private
    def set_user
        @user = User.find(params[:user_id])
    end

    def set_friend
        @friend = current_user.friends.where(friend_id: @user.id)
    end

    def already_follow?
        @user = User.find(params[:user_id])
        Friend.where(user_id: current_user.id, friend_id @user.id).exists?
    end
end


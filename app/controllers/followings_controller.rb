class FollowingsController < ApplicationController
    def create
        @user = User.find(params[:following][:followed_id])
        current_user.follow!(@user)
        redirect_to @user
    end

    def destroy
        @user = Following.find(params[:id]).followed
        current_user.unfollow!(@user)
        redirect_to @user
    end

     def follow 
        current_user.followeds.create({followed_id: params[:id]})
        flash[:sucess] = 'Your request was successful.'
        redirect_to user_path
    end
end

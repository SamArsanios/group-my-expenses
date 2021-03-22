class UsersController < ApplicationController
    include SessionsHelper
    
    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = ['Sign Up Successful']
          log_in @user
          redirect_to @user
        else
          flash[:danger] = @user.errors.full_messages
          render 'new'
        end
       end
    
      def show
        @user = current_user
        return if logged_in?
    
        flash[:danger] = ['Access Denied. Please Login First']
        redirect_to root_url
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :avatar)
      end
end

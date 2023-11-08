# frozen_string_literal: true

module Users
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @service_user = UserService.new(params, User.find(params[:id]))
      @service_user.update_user

      flash[:notice] = 'success update!'
      redirect_to users_users_path
    end

    def destroy
      @user = User.find(params[:id])
      if can?(:destroy, @user) && @user.destroy
        
        flash[:notice] = 'Delete successful'
      else
        flash[:error] = 'Failed to delete user'
      end
    rescue StandardError => e
      flash[:notice] = "An error occurred: #{e.message}"
    ensure
      redirect_to users_users_path
    end

    private

    def user_param
      res = params.require(:user).permit(:email, :role, :name)
      res[:id] = params[:id]
      res
    end
    
  end
end

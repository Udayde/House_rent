# frozen_string_literal: true

# class Users::UsersController.
module Users
  # class Users::UsersController.
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @service_user=UserService.new(params,User.find(params[:id]))
      @service_user.update_user
      flash[:notice] = 'success update!'
      redirect_to users_users_path
    end

    def destroy
      @user = User.find(params[:id])
      begin
          raise StandardError, 'not authorized' unless can? :destroy, @user
          if @user.destroy
            flash[:notice] = 'Deleted successfully'
          else
            flash[:error] = 'Failed to delete user'
          end
          redirect_to users_users_path
        rescue StandardError => e
          flash[:notice] = "An error occurred: #{e.message}"
          redirect_to users_users_path
      end
    end

    private
    def user_param
      res = params.require(:user).permit(:email, :role, :name)
      res[:id] = params[:id]
      res
    end  
  end
end

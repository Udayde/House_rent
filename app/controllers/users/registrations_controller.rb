# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params
    # before_action :configure_account_update_params, only: [:update]
    
    #   def index
    #     @user=User.all
    #   end
        
    #   def new
    #     @user=User.new
    # end

     def create
        @user=User.new(user_param)
        if @user.save
          sign_in @user
          MyFirstJob.perform_async(@user.id)
          redirect_to root_path
        end
      end

    # def edit
    #     @user=User.find(params[:id])
    # end

    # def update
    #     @user=User.find(params[:id])
    #     @user.update(user_param)
    # end

    # def destroy
    #     @user=User.find(params[:id])
    #     @user.destroy
    # end

    # def show
    #     @user=House.find(params[:id])
    # end

     private

         def  user_param
              params.required(:user).permit(:email ,:password,:password_confirmation ,:name)
         end

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create

    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # end

    # # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    #  end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end

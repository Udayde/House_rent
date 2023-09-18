class UserController < ApplicationController
    def index 
        @user=User.all
    end


    def new
        @user=User.new
    end

    def create
        @user=User.new(user_param)
         @user.save 
            
    end

    def edit 
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        @user.update(user_param)
    end

    def destroy 
        @user=User.find(params[:id])
        @user.destroy
    end

    def show 
        @user=House.find(params[:id])
    end


    private

        def  user_param 
             params.required(:user).permit(:email ,:encrypted_password, :role ,:name)
        end
    

end

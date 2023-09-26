class Users::UsersController < ApplicationController
  

    def index 
        @users=User.all
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @User=User.find(params[:id])
        if @User.update(user_param)
            flash[:notice] = 'success update!'
            redirect_to users_path
        end
    end

    def destroy 
        @user=User.find(params[:id])
        if @user.destroy
				flash[:notice] = 'deleted sucessfully'
				redirect_to users_users_path
        end
    end

  

    private

    def user_param
        #debugger
        res = params.require(:user).permit(:email,:role, :name )
                    res[:user_id] = current_user.id
                    res
    end

end




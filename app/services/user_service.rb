class UserService 
    def initialize(params,user)
        @params=params
        @user=user
    end

    def update_user 
        # @user = User.find(@params[:id])
        return unless @user.update(user_param)
    end

  private
  def user_param
    res = @params.require(:user).permit(:email, :role, :name)
    res[:id] = @user.id
    res
  end
end
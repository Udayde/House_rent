class ApplicationController < ActionController::Base
before_action :authenticate_user!

rescue_from CanCan::AccessDenied do |exception|
    # respond_to do |format|
    # #   format.json { head :forbidden }doubt
    #   format.html { redirect_to root_path, alert: exception.message }
     
    # end
    render json: 'un authorized!'
  end

end

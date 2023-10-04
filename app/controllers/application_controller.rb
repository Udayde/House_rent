class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    # respond_to do |format|
    # #   format.json { head :forbidden }doubt
    #   format.html { redirect_to root_path, alert: exception.message }

    # end
    render json: 'unauthorized!'
  end

  # rescue_from NoMethodError, with: :handle_no_method_error

  private

  def handle_no_method_error(exception)
    # Log the error or do any other necessary error handling
    Rails.logger.error("NoMethodError: #{exception.message}")
    # Redirect to the home page
    redirect_to root_path
  end
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def handle_record_not_found
    # Optionally, you can set a flash message to provide user feedback
    flash[:alert] = 'House not found. Please check the provided ID.'

    # Redirect to a specific page, e.g., the home page or an error page
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end

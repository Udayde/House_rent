# frozen_string_literal: true

# class ApplicationController.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    render json: 'unauthorized!'
  end

  # rescue_from NoMethodError, with: :handle_no_method_error

  private

  def handle_no_method_error(exception)
    Rails.logger.error("NoMethodError: #{exception.message}")
    redirect_to root_path
  end
  
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

end

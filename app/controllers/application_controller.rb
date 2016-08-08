class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to advertisements_path, :alert => exception.message
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email)}
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:firstname, :lastname,:email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname,:lastname,:email, :password, :password_confirmation, :current_password) }
  end

end

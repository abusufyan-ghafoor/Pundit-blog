class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_cart_exists
  

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :phone, :user_type, :email, :password)}
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :user_type, :email, :password, :current_password)}
    end

  private
 
    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
    def ensure_cart_exists
      session[:cart] ||= []
    end
end

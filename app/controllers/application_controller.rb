class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :home
  protect_from_forgery with: :exception


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :profile_picture]
    devise_parameter_sanitizer.for(:account_update) << [:name, :profile_picture]
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :home
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :profile_picture]
    devise_parameter_sanitizer.for(:account_update) << [:name, :profile_picture]
  end


  protected

  def layout_by_resource
    if devise_controller? && action_name != 'edit'
      "homepage"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    events_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # def after_sign_up_path_for(resource_or_scope)
  #    new_user_registration_path
  #  end

end

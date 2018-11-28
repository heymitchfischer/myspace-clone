class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])

      devise_parameter_sanitizer.permit(:sign_up, keys: [:age])
      devise_parameter_sanitizer.permit(:account_update, keys: [:age])

      devise_parameter_sanitizer.permit(:sign_up, keys: [:biography])
      devise_parameter_sanitizer.permit(:account_update, keys: [:biography])
  end

end

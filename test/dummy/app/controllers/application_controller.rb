class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  set_current_tenant_through_filter
  before_action :set_tenant
  before_action :authenticate_user!


  def set_tenant
    return unless current_user
    set_current_tenant(current_user.account)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [])
  end
end

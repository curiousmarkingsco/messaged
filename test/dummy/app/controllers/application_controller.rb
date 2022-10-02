class ApplicationController < ActionController::Base
  # respond_to :html, :json
  before_action :configure_permitted_parameters, if: :devise_controller?
  set_current_tenant_through_filter
  before_action :set_tenant


  def set_tenant
    return unless current_user
    set_current_tenant(current_user.account)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [])
  end
end

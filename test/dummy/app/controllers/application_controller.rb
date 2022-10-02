class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_tenant

  def set_tenant
    set_current_tenant(current_user.account)
  end
end

module Messaged
  class ApplicationController < ActionController::Base
    helper Messaged::Engine.helpers
    helper_method \
      :messaged_current_user,
      :messaged_current_tenant

    # The `current_user` and `signed_in?` methods are prefixed with `messaged_`
    # to avoid conflicts with methods from the parent controller.

    def messaged_current_user
      send(Messaged.current_user_method) || NullUser.new
    end

    def messaged_user_signed_in?
      !messaged_current_user.messaged_anonymous?
    end

    # The `current_tenant` and `signed_in?` methods are prefixed with `messaged_`
    # to avoid conflicts with methods from the parent controller.

    def messaged_current_tenant
      send(Messaged.current_tenant_method) || NullTenant.new
    end

    def messaged_tenant_signed_in?
      !messaged_current_tenant.messaged_anonymous?
    end

    def messaged_current_room
      @room = nil
      return unless params && params[:room_id]
      @room = Room.find(params[:room_id])
    end

    # Here we define an owner in the event that there is a current_tenant or
    # current_user, but perhaps not necessarily both without assuming one or the other.
    # Like in models/message.rb, we default to user and fallback to other models.
    def messaged_current_owner
      return messaged_current_user if messaged_current_user
      return messaged_current_room if messaged_current_room
      return messaged_current_tenant if messaged_current_tenant
      return nil
    end

    def messaged_require_login!
      fail Messaged::Errors::LoginRequired if messaged_current_user.messaged_anonymous?
      fail Messaged::Errors::LoginRequired if messaged_current_tenant.messaged_anonymous?
    end
  end
end

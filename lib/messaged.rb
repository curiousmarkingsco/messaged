require "messaged/version"
require "messaged/engine"

module Messaged
  class << self
    # @return [String] The name of the user class
    attr_reader :user_class_name

    # @return [String] The name of the tenant class
    attr_reader :tenant_class_name

    # @return [Symbol] The name of the method used by Messaged controllers and views to get the currently signed-in user
    attr_accessor :current_user_method

    # @return [Symbol] The name of the method used by Messaged controllers and views to get the currently signed-in tenant
    attr_accessor :current_tenant_method

    # @param user_class_name [String]
    def user_class=(user_class_name)
      return nil if user_class_name.nil?
      unless user_class_name.is_a?(String)
        fail "Messaged.user_class must be set to a String, got #{user_class_name.inspect}"
      end
      @user_class_name = user_class_name
    end

    # @return [Class<Messaged::UserExtender>] the user class from the host application.
    def user_class
      # This is nil before the initializer is installed.
      return nil if @user_class_name.nil?
      @user_class_name.constantize
    end

    # @param tenant_class_name [String]
    def tenant_class=(tenant_class_name)
      return nil if tenant_class_name.nil?
      unless tenant_class_name.is_a?(String)
        fail "Messaged.tenant_class must be set to a String, got #{tenant_class_name.inspect}"
      end
      @tenant_class_name = tenant_class_name
    end

    # @return [Class<Messaged::TenantExtender>] the tenant class from the host application.
    def tenant_class
      # This is nil before the initializer is installed.
      return nil if @tenant_class_name.nil?
      @tenant_class_name.constantize
    end
  end
end

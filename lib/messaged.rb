require "messaged/version"
require "messaged/engine"

module Messaged
  class << self
    # @return [String] The name of the user class
    attr_reader :user_class_name

    # @return [String] The name of the tenant class
    attr_reader :tenant_class_name
  end
end

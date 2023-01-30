module Messaged
  class Engine < ::Rails::Engine
    require "importmap-rails"
    require "turbo-rails"
    isolate_namespace Messaged

    config.to_prepare do
      Messaged.user_class&.send(:include, Messaged::UserExtender)
    end
  end
end

module Messaged
  class Engine < ::Rails::Engine
    require "importmap-rails"
    require "turbo-rails"
    isolate_namespace Messaged

    config.to_prepare do
      Messaged.user_class&.send(:include, Messaged::UserExtender)
    end

    # initializer "messaged.assets.precompile" do |app|
    #   app.config.assets.precompile += %w( messaged/application.css )
    # end
  end
end

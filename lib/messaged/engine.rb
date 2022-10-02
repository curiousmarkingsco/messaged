module Messaged
  class Engine < ::Rails::Engine
    require "importmap-rails"
    require "turbo-rails"
    isolate_namespace Messaged

    # initializer "messaged.assets.precompile" do |app|
    #   app.config.assets.precompile += %w( messaged/application.css )
    # end
  end
end

require_relative "lib/messaged/version"

Gem::Specification.new do |spec|
  spec.name        = "messaged"
  spec.version     = Messaged::VERSION
  spec.authors     = ["cjilbert504, ianrandmckenzie"]
  spec.email       = ["ian@curiousmarkings.com"]
  spec.homepage    = "https://github.com/curiousmarkingsco/messaged"
  spec.summary     = "A Rails Engine for Hotwire Turbo-powered instant messaging."
  spec.description = "A quick and easy way to implement an instant-messaging module using Turbo Rails."
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.2.3"
  spec.add_dependency "importmap-rails", ">= 1.1.5"
  spec.add_dependency "turbo-rails", ">= 1.2.0"
end

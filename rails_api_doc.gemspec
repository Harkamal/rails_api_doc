$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_api_doc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_api_doc"
  s.version     = RailsApiDoc::VERSION
  s.authors     = ['Harkamal Singh']
  s.email       = ['honey.rawal89@gmail.com']
  s.homepage    = "https://github.com/Harkamal/rails_api_doc"
  s.summary     = "Create API Documentation"
  s.description = "This engine provides the UI for generating documentation for apis using apidocjs"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "kaminari"
  # s.add_dependency "jquery-rails"

  # s.add_development_dependency "sqlite3"
end

# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "maily_herald/webui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ror_maily-webui"
  s.version     = MailyHerald::Webui::VERSION
  s.authors     = ["Sebastian Velandia"]
  s.email       = ["sebas.velandia27@gmail.com"]
  s.homepage    = "https://github.com/ssoulless/ror_maily-webui"
  s.license     = "LGPL-3.0"
  s.description = s.summary = "Web UI for MailyHerald - Email processing solution for Ruby on Rails applications"

  s.files        = `git ls-files`.split("\n")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files   = `git ls-files -- {spec,features}/**/`.split("\n")

	s.add_dependency 'ror_maily', "~>0.0.1"
	s.add_dependency "smart_listing", "~>1.1.0"
	s.add_dependency "haml"
	s.add_dependency "coffee-rails"
	s.add_dependency 'sass-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "timecop"
  s.add_development_dependency "spring-commands-rspec"
  s.add_development_dependency "therubyracer"
  s.add_development_dependency "uglifier"
  s.add_development_dependency "thin"
end

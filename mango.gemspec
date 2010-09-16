# encoding: UTF-8
require File.expand_path(File.join(File.dirname(__FILE__), "lib", "mango", "version"))

Gem::Specification.new do |s|
  s.name        = "mango"
  s.version     = Mango::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Ryan Sobol"
  s.email       = "contact@ryansobol.com"
  s.homepage    = "http://github.com/ryansobol/mango"
  s.summary     = "Mango is a dynamic, database-free, and open source website framework"
  s.description = "Mango is a dynamic, database-free, and open source website framework that is designed to make life easier for small teams of designers, developers, and content writers."

  s.required_rubygems_version = ">= 1.3.7"
  s.rubyforge_project         = "mango"

  s.add_runtime_dependency "rack",      "~> 1.2.1"
  s.add_runtime_dependency "sinatra",   "~> 1.0"
  s.add_runtime_dependency "haml",      "~> 3.0.18"
  s.add_runtime_dependency "bluecloth", "~> 2.0.7"
  s.add_runtime_dependency "thor",      "~> 0.14.0"

  s.add_development_dependency "rspec",         "~> 1.3.0"
  s.add_development_dependency "rack-test",     "~> 0.5.4"
  s.add_development_dependency "yard",          "~> 0.5.8"
  s.add_development_dependency "bluecloth",     "~> 2.0.7"
  s.add_development_dependency "yard-sinatra",  "~> 0.5.0"

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- spec/*`.split("\n")
  s.executables        = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.default_executable = "mango"
  s.require_paths      = ["lib"]
end

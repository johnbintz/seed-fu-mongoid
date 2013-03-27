# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed-fu-mongoid/version'

Gem::Specification.new do |gem|
  gem.name          = "seed-fu-mongoid"
  gem.version       = SeedFuMongoid::VERSION
  gem.authors       = ["John Bintz"]
  gem.email         = ["john@coswellproductions.com"]
  gem.description   = %q{Seed Fu-like functionality for Mongoid}
  gem.summary       = %q{Seed Fu-like functionality for Mongoid}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'mongoid', '>= 3.0.0'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'database_cleaner'
  gem.add_development_dependency 'cuke-pack'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'guard-cucumber'
end

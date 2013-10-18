# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'messenger/version'

Gem::Specification.new do |spec|
  spec.name          = 'messenger'
  spec.version       = Messenger::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['James Brennan']
  spec.email         = ['james@jamesbrennan.ca']
  spec.description   = 'Messenger is a modular inter-service messenger.'
  spec.summary       = 'Messenger is a modular inter-service messenger.'
  spec.homepage      = 'https://github.com/unbounce/messenger'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency             'rails',     '>= 3.1'
  spec.add_dependency             'railties',  '>= 3.1'
  spec.add_development_dependency 'bundler',   '~> 1.3'
  spec.add_development_dependency 'rspec',     '~> 2.14.1'
  spec.add_development_dependency 'rake',      '~> 10.1.0'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
end

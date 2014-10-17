# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edgecast/version'

Gem::Specification.new do |gem|
  gem.name          = "edgecast"
  gem.version       = Edgecast::VERSION
  gem.authors       = ["Sharethrough"]
  gem.email         = ["engineers@sharethrough.com"]
  gem.description   = %q{Wrapper for interacting with the EdgeCast CDN}
  gem.summary       = %q{This provides a wrapper around the EdgeCast CDN API}
  gem.files         = [
                        "lib/edgecast.rb",
                        "lib/edgecast/cdn.rb",
                      ]

  gem.add_dependency('httparty', '~> 0.11.0')

  gem.add_development_dependency('rake', '~> 10.1.0')
  gem.add_development_dependency('rspec', '~> 2.14.1')
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'what_is/version'

Gem::Specification.new do |spec|
  spec.name          = "what_is"
  spec.version       = WhatIs::VERSION
  spec.authors       = ["Mark Chavez"]
  spec.email         = ["markchav3z@gmail.com"]
  spec.summary       = %q{Defines a string}
  spec.description   = %q{Defines a string}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "nokogiri"
end

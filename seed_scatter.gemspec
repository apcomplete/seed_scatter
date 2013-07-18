# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed_scatter/version'

Gem::Specification.new do |spec|
  spec.name          = "seed_scatter"
  spec.version       = SeedScatter::VERSION
  spec.authors       = ["Alex Padgett"]
  spec.email         = ["apadgett@topicdesign.com"]
  spec.description   = %q{seed scatter changes some utility for rails seed files}
  spec.summary       = %q{seed scatter splits your model seeds into individual files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails', ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "cucumber", "~> 1.3.3"
  spec.add_development_dependency "aruba", "~> 0.5.1"
end

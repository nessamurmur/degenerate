# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'degenerate/version'
require 'bundler/setup'

Gem::Specification.new do |spec|
  spec.name          = "degenerate"
  spec.version       = Degenerate::VERSION
  spec.authors       = ["Nate West", "Eric West"]
  spec.email         = ["natescott.west@gmail.com", "esw9999@gmail.com}"]
  spec.summary       = %q{Random data generator}
  spec.description   = %q{Random data generator for use with Generative.}
  spec.homepage      = "http://github.com/niftyn8/degenerate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec-core', '~> 3.1.3'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
end

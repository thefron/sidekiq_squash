# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq_squash/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq_squash"
  spec.version       = SidekiqSquash::VERSION
  spec.authors       = ["Hoseong Hwang"]
  spec.email         = ["thefron@ultracaption.net"]
  spec.summary       = %q{Sidekiq middleware notifies exceptions to Squash}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/thefron/sidekiq_squash"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("squash_ruby", ">= 1.0.0")

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
end

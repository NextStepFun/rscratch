# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rscratch/version'

Gem::Specification.new do |spec|
  spec.name          = "rscratch"
  spec.version       = RScratch::VERSION
  spec.authors       = ["Enrico Rubboli"]
  spec.email         = ["rubboli@gmail.com"]

  spec.summary       = %q{TODO: Ruby implementation of a scratch-like game engine.}
  spec.homepage      = "http://github.com/RavennaLUG/rscratch"
  spec.license       = "GPL3"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]

  spec.add_dependency 'gosu', "0.7.50"
  spec.add_dependency 'rmagick', "2.15.4"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

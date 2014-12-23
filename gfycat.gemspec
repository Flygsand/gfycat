# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gfycat/version"

Gem::Specification.new do |spec|
  spec.name          = "gfycat"
  spec.version       = Gfycat::VERSION
  spec.authors       = ["protomouse"]
  spec.email         = ["root@protomou.se"]
  spec.summary       = %q{A Ruby interface to the Gfycat API.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/protomouse/gfycat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json", "~> 1.8.1"
  spec.add_dependency "faraday", "~> 0.9.0"
  spec.add_dependency "faraday_middleware", "~> 0.9.1"
  spec.add_dependency "virtus"
  spec.add_dependency "virtus-uri"
  spec.add_dependency "mime-types"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strava/api/v3/version'

Gem::Specification.new do |spec|
  spec.name          = "strava-api-v3"
  spec.version       = Strava::Api::V3::VERSION
  spec.authors       = ["Jared Holdcroft"]
  spec.email         = ["jared@theholdcrofts.com"]
  spec.description   = %q{The library provides a wrapper to Version 3 of the Strava API}
  spec.summary       = %q{Strava API V3}
  spec.homepage      = "http://github.com/jaredholdcroft/strava-api-v3"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "httmultiparty"
end

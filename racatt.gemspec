# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'racatt/version'

Gem::Specification.new do |spec|
  spec.name          = "racatt"
  spec.version       = Racatt::VERSION
  spec.authors       = ["Eric Kessler"]
  spec.email         = ["morrow748@gmail.com"]
  spec.summary       = %q{For when you want a big, easy Rake task shaped button to kick off your RSpec and Cucumber test suites.}
  spec.homepage      = "https://github.com/enkessler/racatt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'cucumber'
  spec.add_dependency 'rspec'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end

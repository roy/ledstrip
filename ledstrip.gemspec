# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ledstrip/version'

Gem::Specification.new do |spec|
  spec.name          = "ledstrip"
  spec.version       = Ledstrip::VERSION
  spec.authors       = ["Roy van der Meij"]
  spec.email         = ["roy@royapps.nl"]
  spec.summary       = "Control your ledstrips with ruby"
  spec.description   = %q{This gems led you control your ledstrips connected to a raspberry pi with Ruby}
  spec.homepage      = "http://github.com/roy/ledstrip"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pi_piper", "1.3.2"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

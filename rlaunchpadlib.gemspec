# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rlaunchpadlib/version'

Gem::Specification.new do |spec|
  spec.name          = "rlaunchpadlib"
  spec.version       = Rlaunchpadlib::VERSION
  spec.authors       = ["Charles Butler"]
  spec.email         = ["chuck@dasroot.net"]
  spec.summary       = %q{Canonical Launchpad API wrapper}
  spec.description   = %q{Canonical Launchpad API wrapper - a best-guess launchpadlib port}
  spec.homepage      = "http://github.com/chuckbutler/rlaunchpadlib"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end

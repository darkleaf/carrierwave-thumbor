# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/thumbor/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-thumbor"
  spec.version       = CarrierWave::Thumbor::VERSION
  spec.authors       = ["Mikhail Kuzmin"]
  spec.email         = ["m.kuzmin@darkleaf.ru"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "carrierwave", "~> 0.10.0"
  spec.add_dependency "rest-client", "~> 1.6.7"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3.0"
  spec.add_development_dependency "rspec", "~> 2.14.0"
end

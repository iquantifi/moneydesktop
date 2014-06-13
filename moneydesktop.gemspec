# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moneydesktop/version'

Gem::Specification.new do |spec|
  spec.name          = "moneydesktop"
  spec.version       = Moneydesktop::VERSION
  spec.authors       = ["jimski"]
  spec.email         = ["jim.siegienski@iquantifi.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "http://github.com/iquantifi/moneydesktop"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httparty', '0.13.1'
  spec.add_runtime_dependency 'hashie', '2.1.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

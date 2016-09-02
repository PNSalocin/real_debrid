# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'real_debrid'

Gem::Specification.new do |spec|
  spec.name          = "real_debrid"
  spec.version       = RealDebrid::VERSION
  spec.authors       = ["Nicolas MERELLI"]
  spec.email         = ["nicolas.merelli@gmail.com"]

  spec.summary       = "Wrapper pour l'API Real-Debrid"
  spec.description   = "Permet de débrider des liens, gérer des torrents... via l'API Real-Debrid"
  spec.homepage      = "https://github.com/PNSalocin/real_debrid"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n").reject { |f| f.match(%r{^(|spec|)/}) }
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "yard"
end

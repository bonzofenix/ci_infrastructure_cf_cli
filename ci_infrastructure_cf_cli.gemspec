# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ci_infrastructure_cf_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "ci_infrastructure_cf_cli"
  spec.version       = CiInfrastructureCfCli::VERSION
  spec.authors       = ["Alan Moran"]
  spec.email         = ["bonzofenix@gmail.com"]
  spec.summary       = %q{ CLI for managing your ci_infrastructure_cf.}
  spec.description   = %q{ provides tools for customizing deployments and provisioning your jenkins machine with the changes.}
  spec.homepage      = "https://github.com/bonzofenix/ci_infrastructure_cf_cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bosh-deployer"
  spec.add_dependency "thor"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

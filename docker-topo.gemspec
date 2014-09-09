# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker/topo/version'

Gem::Specification.new do |spec|
  spec.name          = "docker-topo"
  spec.version       = Docker::Topo::VERSION
  spec.authors       = ["nielsv"]
  spec.email         = ["niels.vandekeybus@tenforce.com"]
  spec.summary       = %q{docker-topo is a simple tool for setting up a docker topology on a single host.}
  spec.description   = %q{docker-topo is a simple wrapper for docker. It allows you to define docker topologies in a YAML file. You can use the dt command to quickly deploy a set of docker images.}
  spec.homepage      = "http://github.com/nvdk/docker-topo"
  spec.license       = "APACHE-2.0"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

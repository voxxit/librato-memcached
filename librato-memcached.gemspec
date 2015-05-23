# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'librato/memcached'

Gem::Specification.new do |spec|
  spec.name          = "librato-memcached"
  spec.version       = Librato::Memcached::VERSION
  spec.authors       = [ "Joshua Delsman" ]
  spec.email         = [ "j@srv.im" ]
  spec.license       = "MIT license (MIT)"
  spec.homepage      = "https://github.com/voxxit/librato-memcached"
  spec.summary       = %q{Send Memcached stats to Librato}
  spec.description   = %q{Send Memcached stats to Librato Metrics in a long-running process/daemon every 60 seconds.}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   << "librato-memcached"
  spec.require_paths = [ "lib" ]

  spec.add_runtime_dependency "dalli",           "~> 2.7", ">= 2.7.4"
  spec.add_runtime_dependency "kgio",            "~> 2.9", ">= 2.9.3"
  spec.add_runtime_dependency "librato-metrics", "~> 1.5", ">= 1.5.0"

  spec.add_development_dependency "bundler",     "~> 1.9"
  spec.add_development_dependency "rake",        "~> 10.0"
end

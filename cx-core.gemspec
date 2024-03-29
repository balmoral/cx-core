# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cx/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'cx-core'
  spec.version       = CX::Core::VERSION
  spec.date          = '2015-04-24'
  spec.summary       = 'CX extensions to core class'
  spec.authors       = ['Colin Gunn']
  spec.email         = 'colgunn@icloud.com'
  spec.homepage      = 'http://rubygemspec.org/gems/cx-core' # TODO: push to rubygems ??
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']
end

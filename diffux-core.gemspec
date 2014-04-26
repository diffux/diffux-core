$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'diffux_core/version'

Gem::Specification.new do |s|
  s.name          = 'diffux-core'
  s.version       = DiffuxCore::VERSION
  s.license       = 'MIT'
  s.summary       = 'Diffux Core'
  s.description   = 'Tools for taking and comparing responsive website snapshots'
  s.authors       = ['Joe Lencioni', 'Henric Trotzig']
  s.email         = ['joe.lencioni@causes.com', 'henric.trotzig@causes.com']
  s.require_paths = ['lib']
  s.files         = Dir['lib/**/*.rb']
  s.executables   = ['diffux-snapshot']

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'oily_png'
  s.add_dependency 'phantomjs', '1.9.2.1'
  s.add_dependency 'diff-lcs'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'mocha'
end

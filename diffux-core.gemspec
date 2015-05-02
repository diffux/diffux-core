$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'diffux_core/version'

Gem::Specification.new do |s|
  s.name          = 'diffux-core'
  s.version       = DiffuxCore::VERSION
  s.license       = 'MIT'
  s.summary       = 'Diffux Core'
  s.description   = 'Tools for taking and comparing responsive website snapshots'
  s.authors       = ['Joe Lencioni', 'Henric Trotzig']
  s.email         = ['joe.lencioni@brigade.com', 'henric.trotzig@brigade.com']
  s.require_paths = ['lib']
  s.files         = Dir['lib/**/*']
  s.executables   = ['diffux-snapshot', 'diffux-compare']

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'chunky_png', '~>1.3.1'
  s.add_dependency 'oily_png', '~> 1.1.1'
  s.add_dependency 'phantomjs', '1.9.2.1'
  s.add_dependency 'diff-lcs', '~> 1.2'

  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'mocha', '~> 1.0'
  s.add_development_dependency 'codeclimate-test-reporter'
end

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'diffux_core'

RSpec.configure do |config|
  config.mock_with :mocha
end

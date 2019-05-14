require 'mentor'
require 'student'
require 'homework'
require 'notifications'
require 'git'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
  config.warnings = false
end

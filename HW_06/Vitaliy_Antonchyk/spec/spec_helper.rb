require 'webmock/rspec'

require 'mentor'
require 'student'
require 'homework'
require 'notifications'
require 'git'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
  config.warnings = false

  config.before(:each) do
    stub_request(:any, /www.example.com/)
      .to_return(status: 200, body: 'stubbed response', headers: {})
  end
end

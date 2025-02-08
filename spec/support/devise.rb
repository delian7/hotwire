# frozen_string_literal: true

RSpec.configure do |config|
  # config.include Devise::TestHelpers

  config.include Devise::Test::IntegrationHelpers, type: :request
  # config.include Devise::TestHelpers, type: :request
  # config.include Warden::Test::Helpers, type: :request
end

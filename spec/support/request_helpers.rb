require 'devise/test_helpers'
require 'warden'

module RequestHelpers

  def json
    @json ||= JSON.parse(response.body)
  end

  def before_all_test
    Warden.test_mode!
  end

  def after_each_test
    Warden.test_reset!
  end

  def logout_user
    logout(:user)
  end

  def login_user(user = nil)
    user ||= FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

end

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :request
  config.include RequestHelpers, type: :request
end

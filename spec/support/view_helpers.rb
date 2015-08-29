require 'devise/test_helpers'

module ViewHelpers

  def user_signed_in
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @current_user = FactoryGirl.create :user

    sign_in @current_user
  end

end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :view
  config.include ViewHelpers, :type => :view
end

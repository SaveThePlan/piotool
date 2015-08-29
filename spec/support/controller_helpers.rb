require 'devise/test_helpers'

module ControllerHelpers

  def user_not_signed_in
    allow_message_expectations_on_nil
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
    allow(controller).to receive(:current_user).and_return(nil)
  end

  def user_signed_in(user = double('user'))
    if user.nil?
      user_not_signed_in
    else
      allow_message_expectations_on_nil
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end

  def admin_signed_in(admin = double('user'))
    admin.add_role :admin
    user_signed_in admin
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end

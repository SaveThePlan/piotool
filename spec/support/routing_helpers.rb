module RoutingHelpers

  def public_routes_context
    allow_message_expectations_on_nil
    allow(nil).to receive(:authenticate?).and_return(false)
  end

end

RSpec.configure do |config|
  config.include RoutingHelpers, type: :routing
end

require "rails_helper"

RSpec.describe "root", type: :routing do
  describe "routing" do

    it "routes to root" do
      expect(:get => "/").to route_to("home#index")
    end

  end
end

require "rails_helper"

RSpec.describe "root", type: :routing do
  describe "routing" do

    it "routes to contacts#index" do
      expect(:get => "/").to route_to("contacts#index")
    end

  end
end

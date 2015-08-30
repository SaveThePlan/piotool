require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users").to route_to("users#index")
    end

    it "routes to #act_as" do
      expect(:post => "/users/1/act_as").to route_to("users#act_as", :id => "1")
    end

    it "routes to #myself_again" do
      expect(:delete => "/users/myself_again").to route_to("users#myself_again")
    end
  end
end

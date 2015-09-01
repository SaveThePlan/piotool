require "rails_helper"

RSpec.describe Notes::OffersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notes/offers").to route_to("notes/offers#index")
    end

    it "routes to #new" do
      expect(:get => "/notes/offers/new").to route_to("notes/offers#new")
    end

    it "routes to #show" do
      expect(:get => "/notes/offers/1").to route_to("notes/offers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notes/offers/1/edit").to route_to("notes/offers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/notes/offers").to route_to("notes/offers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/notes/offers/1").to route_to("notes/offers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/notes/offers/1").to route_to("notes/offers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/notes/offers/1").to route_to("notes/offers#destroy", :id => "1")
    end

  end
end

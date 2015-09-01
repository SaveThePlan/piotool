require "rails_helper"

RSpec.describe Notes::DesiresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notes/desires").to route_to("notes/desires#index")
    end

    it "routes to #new" do
      expect(:get => "/notes/desires/new").to route_to("notes/desires#new")
    end

    it "routes to #show" do
      expect(:get => "/notes/desires/1").to route_to("notes/desires#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notes/desires/1/edit").to route_to("notes/desires#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/notes/desires").to route_to("notes/desires#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/notes/desires/1").to route_to("notes/desires#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/notes/desires/1").to route_to("notes/desires#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/notes/desires/1").to route_to("notes/desires#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe Notes::PersonalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notes/personals").to route_to("notes/personals#index")
    end

    it "routes to #new" do
      expect(:get => "/notes/personals/new").to route_to("notes/personals#new")
    end

    it "routes to #show" do
      expect(:get => "/notes/personals/1").to route_to("notes/personals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notes/personals/1/edit").to route_to("notes/personals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/notes/personals").to route_to("notes/personals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/notes/personals/1").to route_to("notes/personals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/notes/personals/1").to route_to("notes/personals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/notes/personals/1").to route_to("notes/personals#destroy", :id => "1")
    end

  end
end

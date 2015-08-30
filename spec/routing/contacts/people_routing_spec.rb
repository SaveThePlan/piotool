require "rails_helper"

RSpec.describe Contacts::PeopleController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/contacts/people/new").to route_to("contacts/people#new")
    end

    it "routes to #show" do
      expect(:get => "/contacts/people/1").to route_to("contacts/people#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/contacts/people/1/edit").to route_to("contacts/people#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/contacts/people").to route_to("contacts/people#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contacts/people/1").to route_to("contacts/people#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contacts/people/1").to route_to("contacts/people#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contacts/people/1").to route_to("contacts/people#destroy", :id => "1")
    end

  end
end

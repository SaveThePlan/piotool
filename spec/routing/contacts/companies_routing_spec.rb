require "rails_helper"

RSpec.describe Contacts::CompaniesController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/contacts/companies/new").to route_to("contacts/companies#new")
    end

    it "routes to #show" do
      expect(:get => "/contacts/companies/1").to route_to("contacts/companies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/contacts/companies/1/edit").to route_to("contacts/companies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/contacts/companies").to route_to("contacts/companies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contacts/companies/1").to route_to("contacts/companies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contacts/companies/1").to route_to("contacts/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contacts/companies/1").to route_to("contacts/companies#destroy", :id => "1")
    end

  end
end

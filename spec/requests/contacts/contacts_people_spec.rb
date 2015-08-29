require 'rails_helper'

RSpec.describe "Contacts::People", type: :request do
  describe "GET /contacts_people" do
    it "works! (now write some real specs)" do
      get contacts_people_path
      expect(response).to have_http_status(200)
    end
  end
end

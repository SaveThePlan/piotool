require 'rails_helper'

RSpec.describe "Contacts::Companies", type: :request do

  before do
    login_user
  end

  after do
    after_each_test
  end

  describe "GET /contacts_companies" do
    it "works! (now write some real specs)" do
      get contacts_companies_path
      expect(response).to have_http_status(200)
    end
  end
end

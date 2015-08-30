require 'rails_helper'

RSpec.describe "Contacts::Companies", type: :request do

  before do
    login_user
  end

  after do
    after_each_test
  end

  let(:contact) { create :contact_company }

  describe "GET /contacts_companies/:id" do
    it "works! (now write some real specs)" do
      get contacts_company_path(contact)
      expect(response).to have_http_status(200)
    end
  end
end

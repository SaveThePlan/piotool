require 'rails_helper'

RSpec.describe "Notes::Desires", type: :request do

  before do
    login_user
  end

  after do
    after_each_test
  end

  describe "GET /notes_desires" do
    it "works! (now write some real specs)" do
      get notes_desires_path
      expect(response).to have_http_status(200)
    end
  end
end
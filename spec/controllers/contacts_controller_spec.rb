require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:valid_session) { {} }

  let(:user) {create :user}

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns current_user contacts as @contacts" do
      user_contact = create(:contact, user: user)
      other_contact = create(:contact)
      get :index, {}, valid_session
      expect(assigns(:contacts)).to eq([user_contact])
    end
  end

end

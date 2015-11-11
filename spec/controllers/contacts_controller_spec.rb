require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:valid_session) { {} }

  let(:user) { create :user }

  before do
    user_signed_in user
  end

  describe "GET #index" do
    context 'without params' do
      it "assigns current_user contacts as @contacts" do
        user_contact = create(:contact, user: user)
        other_contact = create(:contact)
        get :index, {}, valid_session
        expect(assigns(:contacts)).to eq([user_contact])
      end

      it "assigns :nil as @search_scope" do
        get :index, {}, valid_session
        expect(assigns(:search_scope)).to be_nil
      end

      it "assigns :nil as @search_field" do
        get :index, {}, valid_session
        expect(assigns(:search_field)).to be_nil
      end
    end

    context 'with params' do
      it "assigns 'searchString' as @search_scope" do
        get :index, {options: {search: 'searchString'}}, valid_session
        expect(assigns(:search_scope)).to eq 'searchString'
      end

      it "assigns :name as @search_field" do
        get :index, {options: {search_field: 'name'}}, valid_session
        expect(assigns(:search_field)).to eq :name
      end
    end
  end

end

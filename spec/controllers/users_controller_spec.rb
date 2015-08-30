require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  include Devise::TestHelpers

  let(:admin) { FactoryGirl.create(:user, email: 'admin@mail.fr') }
  let(:user2) { FactoryGirl.create(:user, email: 'user2@mail.fr') }
  let!(:users) { FactoryGirl.create_list(:user, 5) }

  let(:valid_session) { {} }

  before do
    admin_signed_in admin
  end

  describe 'GET .index' do
    before do
      get :index
    end

    it 'assign @users' do
      expect(assigns(:users).length).to eq users.length
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end
  end

  describe 'POST .act_as' do
    before do
      post :act_as, {id: user2.to_param}
    end

    it 'store act_as/admin id in session' do
      expect(session[:act_as]['admin']).to eq admin.id.to_s
    end

    it 'store act_as/user id in session' do
      expect(session[:act_as]['user']).to eq user2.id.to_s
    end

    it 'signs in the new user' do
      expect(session['warden.user.user.key'][0][0]).to eq user2.id
    end

    it 'not change the new user sign_in_count' do
      expect(user2.sign_in_count).to eq user2.reload.sign_in_count
    end

    it 'redirect' do
      expect(response).to redirect_to root_path
    end
  end

  describe 'DELETE .myself_again' do
    before do
      session[:act_as] = {'user' => user2.id, 'admin' => admin.id}
      delete :myself_again
    end

    it 'signs in the admin' do
      expect(session['warden.user.user.key'][0][0]).to eq admin.id
    end

    it 'redirect to root' do
      expect(response).to redirect_to root_path
    end
  end
end

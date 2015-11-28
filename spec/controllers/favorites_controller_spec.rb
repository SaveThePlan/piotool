require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  let(:valid_attributes) {
    attributes_for :favorite
  }

  let(:invalid_attributes) {
    attributes_for :favorite, title: nil
  }

  let(:valid_session) { {} }

  let(:user) { create :user }

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns current_user favorites as @favorites" do
      user_favorite = create(:favorite, user: user)
      other_favorite = create(:favorite)
      get :index, {}, valid_session
      expect(assigns(:favorites)).to eq([user_favorite])
    end
  end

  describe "GET #show" do
    it "assigns the requested favorite as @favorite" do
      favorite = create(:favorite)
      get :show, {:id => favorite.to_param}, valid_session
      expect(assigns(:favorite)).to eq(favorite)
    end
  end

  describe "GET #new" do
    it "assigns a new favorite as @favorite" do
      get :new, {}, valid_session
      expect(assigns(:favorite)).to be_a_new(Favorite)
    end
  end

  describe "GET #edit" do
    it "assigns the requested favorite as @favorite" do
      favorite = create(:favorite)
      get :edit, {:id => favorite.to_param}, valid_session
      expect(assigns(:favorite)).to eq(favorite)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new favorite" do
        expect {
          post :create, {:favorite => valid_attributes}, valid_session
        }.to change(Favorite, :count).by(1)
      end

      it "assigns a newly created favorite as @favorite" do
        post :create, {:favorite => valid_attributes}, valid_session
        expect(assigns(:favorite)).to be_a(Favorite)
        expect(assigns(:favorite)).to be_persisted
      end

      it "newly created favorite belongs_to user" do
        post :create, {:favorite => valid_attributes}, valid_session
        expect(assigns(:favorite).user).to eq user
      end

      it "redirects to the created favorite" do
        post :create, {:favorite => valid_attributes}, valid_session
        expect(response).to redirect_to(Favorite.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved favorite as @favorite" do
        post :create, {:favorite => invalid_attributes}, valid_session
        expect(assigns(:favorite)).to be_a_new(Favorite)
      end

      it "re-renders the 'new' template" do
        post :create, {:favorite => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: 'new content'}
      }

      it "updates the requested favorite" do
        favorite = create(:favorite)
        put :update, {:id => favorite.to_param, :favorite => new_attributes}, valid_session
        favorite.reload
        expect(favorite.content).to eq new_attributes[:content]
      end

      it "assigns the requested favorite as @favorite" do
        favorite = create(:favorite)
        put :update, {:id => favorite.to_param, :favorite => valid_attributes}, valid_session
        expect(assigns(:favorite)).to eq(favorite)
      end

      it "redirects to the favorite" do
        favorite = create(:favorite)
        put :update, {:id => favorite.to_param, :favorite => valid_attributes}, valid_session
        expect(response).to redirect_to(favorite)
      end
    end

    context "with invalid params" do
      it "assigns the favorite as @favorite" do
        favorite = create(:favorite)
        put :update, {:id => favorite.to_param, :favorite => invalid_attributes}, valid_session
        expect(assigns(:favorite)).to eq(favorite)
      end

      it "re-renders the 'edit' template" do
        favorite = create(:favorite)
        put :update, {:id => favorite.to_param, :favorite => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested favorite" do
      favorite = create(:favorite)
      expect {
        delete :destroy, {:id => favorite.to_param}, valid_session
      }.to change(Favorite, :count).by(-1)
    end

    it "redirects to the favorites list" do
      favorite = create(:favorite)
      delete :destroy, {:id => favorite.to_param}, valid_session
      expect(response).to redirect_to(favorites_url)
    end
  end

end

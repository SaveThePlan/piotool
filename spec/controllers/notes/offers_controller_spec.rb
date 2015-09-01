require 'rails_helper'

RSpec.describe Notes::OffersController, type: :controller do

  let(:valid_attributes) {
    attributes_for :note_offer
  }

  let(:valid_session) { {} }


  let(:user) {create :user}

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all notes_offers as @notes_offers" do
      offer = create(:note_offer)
      get :index, {}, valid_session
      expect(assigns(:notes)).to eq([offer])
    end
  end

  describe "GET #show" do
    it "assigns the requested notes_offer as @notes_offer" do
      offer = create(:note_offer)
      get :show, {:id => offer.to_param}, valid_session
      expect(assigns(:note)).to eq(offer)
    end
  end

  describe "GET #new" do
    it "assigns a new notes_offer as @notes_offer" do
      get :new, {}, valid_session
      expect(assigns(:note)).to be_a_new(Notes::Offer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notes_offer as @notes_offer" do
      offer = create(:note_offer)
      get :edit, {:id => offer.to_param}, valid_session
      expect(assigns(:note)).to eq(offer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Notes::Offer" do
        expect {
          post :create, {:notes_offer => valid_attributes}, valid_session
        }.to change(Notes::Offer, :count).by(1)
      end

      it "assigns a newly created notes_offer as @notes_offer" do
        post :create, {:notes_offer => valid_attributes}, valid_session
        expect(assigns(:note)).to be_a(Notes::Offer)
        expect(assigns(:note)).to be_persisted
      end

      it "redirects to the created notes_offer" do
        post :create, {:notes_offer => valid_attributes}, valid_session
        expect(response).to redirect_to(Notes::Offer.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: 'new content'}
      }

      it "updates the requested notes_offer" do
        offer = create(:note_offer)
        put :update, {:id => offer.to_param, :notes_offer => new_attributes}, valid_session
        offer.reload
        expect(offer.content).to eq new_attributes[:content]
      end

      it "assigns the requested notes_offer as @notes_offer" do
        offer = create(:note_offer)
        put :update, {:id => offer.to_param, :notes_offer => valid_attributes}, valid_session
        expect(assigns(:note)).to eq(offer)
      end

      it "redirects to the notes_offer" do
        offer = create(:note_offer)
        put :update, {:id => offer.to_param, :notes_offer => valid_attributes}, valid_session
        expect(response).to redirect_to(offer)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested notes_offer" do
      offer = create(:note_offer)
      expect {
        delete :destroy, {:id => offer.to_param}, valid_session
      }.to change(Notes::Offer, :count).by(-1)
    end

    it "redirects to the notes_offers list" do
      offer = create(:note_offer)
      delete :destroy, {:id => offer.to_param}, valid_session
      expect(response).to redirect_to(notes_offers_url)
    end
  end

end

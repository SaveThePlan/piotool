require 'rails_helper'

RSpec.describe Notes::DesiresController, type: :controller do

  let(:valid_attributes) {
    attributes_for :note_desire
  }

  let(:valid_session) { {} }

  let(:user) {create :user}

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all notes_desires as @notes_desires" do
      desire = create(:note_desire)
      get :index, {}, valid_session
      expect(assigns(:notes)).to eq([desire])
    end
  end

  describe "GET #show" do
    it "assigns the requested notes_desire as @notes_desire" do
      desire = create(:note_desire)
      get :show, {:id => desire.to_param}, valid_session
      expect(assigns(:note)).to eq(desire)
    end
  end

  describe "GET #new" do
    it "assigns a new notes_desire as @notes_desire" do
      get :new, {}, valid_session
      expect(assigns(:note)).to be_a_new(Notes::Desire)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notes_desire as @notes_desire" do
      desire = create(:note_desire)
      get :edit, {:id => desire.to_param}, valid_session
      expect(assigns(:note)).to eq(desire)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Notes::Desire" do
        expect {
          post :create, {:notes_desire => valid_attributes}, valid_session
        }.to change(Notes::Desire, :count).by(1)
      end

      it "assigns a newly created notes_desire as @notes_desire" do
        post :create, {:notes_desire => valid_attributes}, valid_session
        expect(assigns(:note)).to be_a(Notes::Desire)
        expect(assigns(:note)).to be_persisted
      end

      it "redirects to the created notes_desire" do
        post :create, {:notes_desire => valid_attributes}, valid_session
        expect(response).to redirect_to(Notes::Desire.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: 'new content'}
      }

      it "updates the requested notes_desire" do
        desire = create(:note_desire)
        put :update, {:id => desire.to_param, :notes_desire => new_attributes}, valid_session
        desire.reload
        expect(desire.content).to eq new_attributes[:content]
      end

      it "assigns the requested notes_desire as @notes_desire" do
        desire = create(:note_desire)
        put :update, {:id => desire.to_param, :notes_desire => valid_attributes}, valid_session
        expect(assigns(:note)).to eq(desire)
      end

      it "redirects to the notes_desire" do
        desire = create(:note_desire)
        put :update, {:id => desire.to_param, :notes_desire => valid_attributes}, valid_session
        expect(response).to redirect_to(desire)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested notes_desire" do
      desire = create(:note_desire)
      expect {
        delete :destroy, {:id => desire.to_param}, valid_session
      }.to change(Notes::Desire, :count).by(-1)
    end

    it "redirects to the notes_desires list" do
      desire = create(:note_desire)
      delete :destroy, {:id => desire.to_param}, valid_session
      expect(response).to redirect_to(notes_desires_url)
    end
  end

end

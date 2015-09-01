require 'rails_helper'

RSpec.describe Notes::PersonalsController, type: :controller do

  let(:valid_attributes) {
    attributes_for :note_personal
  }

  let(:valid_session) { {} }

  let(:user) {create :user}

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all notes_personals as @notes_personals" do
      personal = create(:note_personal)
      get :index, {}, valid_session
      expect(assigns(:notes)).to eq([personal])
    end
  end

  describe "GET #show" do
    it "assigns the requested notes_personal as @notes_personal" do
      personal = create(:note_personal)
      get :show, {:id => personal.to_param}, valid_session
      expect(assigns(:note)).to eq(personal)
    end
  end

  describe "GET #new" do
    it "assigns a new notes_personal as @notes_personal" do
      get :new, {}, valid_session
      expect(assigns(:note)).to be_a_new(Notes::Personal)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notes_personal as @notes_personal" do
      personal = create(:note_personal)
      get :edit, {:id => personal.to_param}, valid_session
      expect(assigns(:note)).to eq(personal)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Notes::Personal" do
        expect {
          post :create, {:notes_personal => valid_attributes}, valid_session
        }.to change(Notes::Personal, :count).by(1)
      end

      it "assigns a newly created notes_personal as @notes_personal" do
        post :create, {:notes_personal => valid_attributes}, valid_session
        expect(assigns(:note)).to be_a(Notes::Personal)
        expect(assigns(:note)).to be_persisted
      end

      it "redirects to the created notes_personal" do
        post :create, {:notes_personal => valid_attributes}, valid_session
        expect(response).to redirect_to(Notes::Personal.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: 'new content'}
      }

      it "updates the requested notes_personal" do
        personal = create(:note_personal)
        put :update, {:id => personal.to_param, :notes_personal => new_attributes}, valid_session
        personal.reload
        expect(personal.content).to eq new_attributes[:content]
      end

      it "assigns the requested notes_personal as @notes_personal" do
        personal = create(:note_personal)
        put :update, {:id => personal.to_param, :notes_personal => valid_attributes}, valid_session
        expect(assigns(:note)).to eq(personal)
      end

      it "redirects to the notes_personal" do
        personal = create(:note_personal)
        put :update, {:id => personal.to_param, :notes_personal => valid_attributes}, valid_session
        expect(response).to redirect_to(personal)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested notes_personal" do
      personal = create(:note_personal)
      expect {
        delete :destroy, {:id => personal.to_param}, valid_session
      }.to change(Notes::Personal, :count).by(-1)
    end

    it "redirects to the notes_personals list" do
      personal = create(:note_personal)
      delete :destroy, {:id => personal.to_param}, valid_session
      expect(response).to redirect_to(notes_personals_url)
    end
  end

end

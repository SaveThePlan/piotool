require 'rails_helper'

RSpec.describe NotesController, type: :controller do

  let(:valid_attributes) {
    attributes_for :note
  }

  let(:invalid_attributes) {
    attributes_for :note, kind: nil
  }

  let(:valid_session) { {} }

  let(:user) { create :user }

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns current_user notes as @notes" do
      user_note = create(:note, user: user)
      other_note = create(:note)
      get :index, {}, valid_session
      expect(assigns(:notes)).to eq([user_note])
    end
  end

  describe "GET #show" do
    it "assigns the requested note as @note" do
      note = create(:note)
      get :show, {:id => note.to_param}, valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe "GET #new" do
    it "assigns a new note as @note" do
      get :new, {}, valid_session
      expect(assigns(:note)).to be_a_new(Note)
    end

    it "assigns a user contacts as @contacts" do
      user_contact = create :contact, user: user
      contact = create :contact
      get :new, {}, valid_session
      expect(assigns(:contacts)).to match_array [user_contact]
    end
  end

  describe "GET #new_for_contact" do
    let(:contact) { create :contact }

    it "assigns a new note as @note" do
      get :new_for_contact, {contact_id: contact.to_param}, valid_session
      expect(assigns(:note)).to be_a_new(Note)
    end

    it "assigns a new note linked to contact as @note" do
      get :new_for_contact, {contact_id: contact.to_param}, valid_session
      expect(assigns(:note).contact).to eq contact
    end

    it "render new template" do
      get :new_for_contact, {contact_id: contact.to_param}, valid_session
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "assigns the requested note as @note" do
      note = create(:note)
      get :edit, {:id => note.to_param}, valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contacts::Company" do
        expect {
          post :create, {:note => valid_attributes}, valid_session
        }.to change(Note, :count).by(1)
      end

      it "assigns a newly created note as @note" do
        post :create, {:note => valid_attributes}, valid_session
        expect(assigns(:note)).to be_a(Note)
        expect(assigns(:note)).to be_persisted
      end

      it "newly created note belongs_to user" do
        post :create, {:note => valid_attributes}, valid_session
        expect(assigns(:note).user).to eq user
      end

      it "redirects to the created note" do
        post :create, {:note => valid_attributes}, valid_session
        expect(response).to redirect_to(Note.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved note as @note" do
        post :create, {:note => invalid_attributes}, valid_session
        expect(assigns(:note)).to be_a_new(Note)
      end

      it "re-renders the 'new' template" do
        post :create, {:note => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {content: 'new content'}
      }

      it "updates the requested contacts_company" do
        note = create(:note)
        put :update, {:id => note.to_param, :note => new_attributes}, valid_session
        note.reload
        expect(note.content).to eq new_attributes[:content]
      end

      it "assigns the requested note as @note" do
        note = create(:note)
        put :update, {:id => note.to_param, :note => valid_attributes}, valid_session
        expect(assigns(:note)).to eq(note)
      end

      it "redirects to the note" do
        note = create(:note)
        put :update, {:id => note.to_param, :note => valid_attributes}, valid_session
        expect(response).to redirect_to(note)
      end
    end

    context "with invalid params" do
      it "assigns the contacts_company as @note" do
        note = create(:note)
        put :update, {:id => note.to_param, :note => invalid_attributes}, valid_session
        expect(assigns(:note)).to eq(note)
      end

      it "re-renders the 'edit' template" do
        note = create(:note)
        put :update, {:id => note.to_param, :note => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested note" do
      note = create(:note)
      expect {
        delete :destroy, {:id => note.to_param}, valid_session
      }.to change(Note, :count).by(-1)
    end

    it "redirects to the notes list" do
      note = create(:note)
      delete :destroy, {:id => note.to_param}, valid_session
      expect(response).to redirect_to(notes_url)
    end
  end

end

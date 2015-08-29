require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:valid_attributes) {
    attributes_for :contact
  }

  let(:invalid_attributes) {
    attributes_for :contact, name: nil
  }

  let(:valid_session) { {} }

  let(:user) {create :user}

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all contacts as @contacts" do
      contact = create(:contact)
      get :index, {}, valid_session
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe "GET #show" do
    it "assigns the requested contact as @contact" do
      contact = create(:contact)
      get :show, {:id => contact.to_param}, valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "GET #new" do
    it "assigns a new contact as @contact" do
      get :new, {}, valid_session
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contact as @contact" do
      contact = create(:contact)
      get :edit, {:id => contact.to_param}, valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, {:contact => valid_attributes}, valid_session
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        post :create, {:contact => valid_attributes}, valid_session
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it "newly created contact belongs_to user" do
        post :create, {:contact => valid_attributes}, valid_session
        expect(assigns(:contact).user).to eq user
      end

      it "redirects to the created contact" do
        post :create, {:contact => valid_attributes}, valid_session
        expect(response).to redirect_to(Contact.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        post :create, {:contact => invalid_attributes}, valid_session
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        post :create, {:contact => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name:'new name'}
      }

      it "updates the requested contact" do
        contact = create(:contact)
        put :update, {:id => contact.to_param, :contact => new_attributes}, valid_session
        contact.reload
        expect(contact.name).to eq new_attributes[:name]
      end

      it "assigns the requested contact as @contact" do
        contact = create(:contact)
        put :update, {:id => contact.to_param, :contact => valid_attributes}, valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it "redirects to the contact" do
        contact = create(:contact)
        put :update, {:id => contact.to_param, :contact => valid_attributes}, valid_session
        expect(response).to redirect_to(contact)
      end
    end

    context "with invalid params" do
      it "assigns the contact as @contact" do
        contact = create(:contact)
        put :update, {:id => contact.to_param, :contact => invalid_attributes}, valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it "re-renders the 'edit' template" do
        contact = create(:contact)
        put :update, {:id => contact.to_param, :contact => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contact" do
      contact = create(:contact)
      expect {
        delete :destroy, {:id => contact.to_param}, valid_session
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = create(:contact)
      delete :destroy, {:id => contact.to_param}, valid_session
      expect(response).to redirect_to(contacts_url)
    end
  end

end

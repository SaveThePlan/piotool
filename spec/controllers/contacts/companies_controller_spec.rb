require 'rails_helper'

RSpec.describe Contacts::CompaniesController, type: :controller do

  let(:valid_attributes) {
    attributes_for :contact_company
  }

  let(:invalid_attributes) {
    attributes_for :contact_company, name: nil
  }

  let(:user) { create :user }

  let(:valid_session) { {} }

  before do
    user_signed_in user
  end

  describe "GET #show" do
    let!(:company) { create(:contact_company) }
    let!(:desire) { create(:note, contact: company, kind: :desire) }
    let!(:offer) { create(:note, contact: company, kind: :offer) }
    let!(:personal) { create(:note, contact: company, kind: :personal) }

    it "assigns the requested contacts_company as @contact" do
      get :show, {:id => company.to_param}, valid_session
      expect(assigns(:contact)).to eq(company)
    end

    it "assigns the requested @desire_notes" do
      get :show, {:id => company.to_param}, valid_session
      expect(assigns(:desire_notes)).to match_array [desire]
    end

    it "assigns the requested @offer_notes" do
      get :show, {:id => company.to_param}, valid_session
      expect(assigns(:offer_notes)).to match_array [offer]
    end

    it "assigns the requested @personal_notes" do
      get :show, {:id => company.to_param}, valid_session
      expect(assigns(:personal_notes)).to match_array [personal]
    end
  end

  describe "GET #new" do
    it "assigns a new contacts_company as @contact" do
      get :new, {}, valid_session
      expect(assigns(:contact)).to be_a_new(Contacts::Company)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contacts_company as @contact" do
      company = create(:contact_company)
      get :edit, {:id => company.to_param}, valid_session
      expect(assigns(:contact)).to eq(company)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contacts::Company" do
        expect {
          post :create, {:contacts_company => valid_attributes}, valid_session
        }.to change(Contacts::Company, :count).by(1)
      end

      it "assigns a newly created contacts_company as @contacts_company" do
        post :create, {:contacts_company => valid_attributes}, valid_session
        expect(assigns(:contact)).to be_a(Contacts::Company)
        expect(assigns(:contact)).to be_persisted
      end

      it "newly created contacts_company belongs_to user" do
        post :create, {:contacts_company => valid_attributes}, valid_session
        expect(assigns(:contact).user).to eq user
      end

      it "redirects to the created contacts_company" do
        post :create, {:contacts_company => valid_attributes}, valid_session
        expect(response).to redirect_to(Contacts::Company.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contacts_company as @contact" do
        post :create, {:contacts_company => invalid_attributes}, valid_session
        expect(assigns(:contact)).to be_a_new(Contacts::Company)
      end

      it "re-renders the 'new' template" do
        post :create, {:contacts_company => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'new name'}
      }

      it "updates the requested contacts_company" do
        company = create(:contact_company)
        put :update, {:id => company.to_param, :contacts_company => new_attributes}, valid_session
        company.reload
        expect(company.name).to eq new_attributes[:name]
      end

      it "assigns the requested contacts_company as @contact" do
        company = create(:contact_company)
        put :update, {:id => company.to_param, :contacts_company => valid_attributes}, valid_session
        expect(assigns(:contact)).to eq(company)
      end

      it "redirects to the contacts_company" do
        company = create(:contact_company)
        put :update, {:id => company.to_param, :contacts_company => valid_attributes}, valid_session
        expect(response).to redirect_to(company)
      end
    end

    context "with invalid params" do
      it "assigns the contacts_company as @contact" do
        company = create(:contact_company)
        put :update, {:id => company.to_param, :contacts_company => invalid_attributes}, valid_session
        expect(assigns(:contact)).to eq(company)
      end

      it "re-renders the 'edit' template" do
        company = create(:contact_company)
        put :update, {:id => company.to_param, :contacts_company => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contacts_company" do
      company = create(:contact_company)
      expect {
        delete :destroy, {:id => company.to_param}, valid_session
      }.to change(Contacts::Company, :count).by(-1)
    end

    it "redirects to the contacts_companies list" do
      company = create(:contact_company)
      delete :destroy, {:id => company.to_param}, valid_session
      expect(response).to redirect_to(contacts_url)
    end
  end

end

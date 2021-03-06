require 'rails_helper'

RSpec.describe Contacts::PeopleController, type: :controller do

  let(:valid_attributes) {
    attributes_for :contact_person
  }

  let(:invalid_attributes) {
    attributes_for :contact_person, name: nil
  }

  let(:user) { create :user }

  let(:valid_session) { {} }

  before do
    user_signed_in user
  end

  describe "GET #show" do
    let!(:person) { create(:contact_person) }
    let!(:note) { create(:note, contact: person) }

    it "assigns the requested contacts_person as @contact" do
      get :show, {:id => person.to_param}, valid_session
      expect(assigns(:contact)).to eq(person)
    end

    it "assigns the requested @notes" do
      get :show, {:id => person.to_param}, valid_session
      expect(assigns(:notes)).to match_array [note]
    end
  end

  describe "GET #new" do
    it "assigns a new contacts_person as @contact" do
      get :new, {}, valid_session
      expect(assigns(:contact)).to be_a_new(Contacts::Person)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contacts_person as @contact" do
      person = create(:contact_person)
      get :edit, {:id => person.to_param}, valid_session
      expect(assigns(:contact)).to eq(person)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contacts::Person" do
        expect {
          post :create, {:contacts_person => valid_attributes}, valid_session
        }.to change(Contacts::Person, :count).by(1)
      end

      it "assigns a newly created contacts_person as @contact" do
        post :create, {:contacts_person => valid_attributes}, valid_session
        expect(assigns(:contact)).to be_a(Contacts::Person)
        expect(assigns(:contact)).to be_persisted
      end

      it "newly created contacts_person belongs_to user" do
        post :create, {:contacts_person => valid_attributes}, valid_session
        expect(assigns(:contact).user).to eq user
      end

      it "redirects to the created contacts_person" do
        post :create, {:contacts_person => valid_attributes}, valid_session
        expect(response).to redirect_to(Contacts::Person.last)
      end

      it 'not link person to a company' do
        post :create, {:contacts_person => valid_attributes, contacts_company: {name: ''}}, valid_session
        expect(assigns(:contact).company).to be_nil
      end

      context 'with a company_id' do
        it 'link person to company' do
          company = create :contact_company
          post :create, {:contacts_person => valid_attributes.merge(company_id: company.id), contacts_company: {name: ''}}, valid_session
          expect(assigns(:contact).company).to eq company
        end
      end

      context 'with new company fields' do
        it 'change company count' do
          expect {
            post :create, {:contacts_person => valid_attributes, contacts_company: attributes_for(:contact_company)}, valid_session
          }.to change(Contacts::Company, :count).by(1)
        end

        it 'link person to newly created company' do
          post :create, {:contacts_person => valid_attributes, contacts_company: attributes_for(:contact_company)}, valid_session
          expect(assigns(:contact).company).to_not be_nil
          expect(assigns(:contact).company).to eq Contacts::Company.last
        end
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contacts_person as @contact" do
        post :create, {:contacts_person => invalid_attributes}, valid_session
        expect(assigns(:contact)).to be_a_new(Contacts::Person)
      end

      it "re-renders the 'new' template" do
        post :create, {:contacts_person => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'New name'}
      }

      it "updates the requested contacts_person" do
        person = create(:contact_person)
        put :update, {:id => person.to_param, :contacts_person => new_attributes}, valid_session
        person.reload
        expect(person.name).to eq new_attributes[:name]
      end

      it "assigns the requested contacts_person as @contact" do
        person = create(:contact_person)
        put :update, {:id => person.to_param, :contacts_person => new_attributes}, valid_session
        expect(assigns(:contact)).to eq(person)
      end

      it "redirects to the contacts_person" do
        person = create(:contact_person)
        put :update, {:id => person.to_param, :contacts_person => new_attributes}, valid_session
        expect(response).to redirect_to(person)
      end

      context 'with a company_id' do
        it 'link person to company' do
          person = create(:contact_person)
          company = create :contact_company
          put :update, {:id => person.to_param, :contacts_person => new_attributes.merge(company_id: company.id), contacts_company: {name: ''}}, valid_session
          expect(person.reload.company).to eq company
        end
      end

      context 'remove company' do
        it 'remove link person to company' do
          company = create :contact_company
          person = create(:contact_person, company: company)
          put :update, {:id => person.to_param, :contacts_person => new_attributes.merge(company_id: ''), contacts_company: {name: ''}}, valid_session
          expect(person.reload.company).to be_nil
        end
      end

      context 'with new company fields' do
        it 'change company count' do
          person = create(:contact_person)
          expect {
            put :update, {:id => person.to_param, :contacts_person => new_attributes, contacts_company: attributes_for(:contact_company)}, valid_session
          }.to change(Contacts::Company, :count).by(1)
        end

        it 'link person to newly created company' do
          person = create(:contact_person)
          put :update, {:id => person.to_param, :contacts_person => new_attributes, contacts_company: attributes_for(:contact_company)}, valid_session
          expect(person.reload.company).to_not be_nil
          expect(person.reload.company).to eq Contacts::Company.last
        end

        context 'change company for a new one' do
          it 'change company count' do
            company = create :contact_company
            person = create(:contact_person, company: company)
            expect {
              put :update, {:id => person.to_param, :contacts_person => new_attributes.merge(company_id: ''), contacts_company: {name: 'Yahoo'}}, valid_session
            }.to change(Contacts::Company, :count).by(1)
          end

          it 're-link person to company' do
            company = create :contact_company
            person = create(:contact_person, company: company)
            put :update, {:id => person.to_param, :contacts_person => new_attributes.merge(company_id: ''), contacts_company: {name: 'Yahoo'}}, valid_session
            expect(person.reload.company).to_not be_nil
            expect(person.reload.company).to eq Contacts::Company.last
            expect(person.reload.company.name).to eq 'Yahoo'
          end
        end
      end

    end

    context "with invalid params" do
      it "assigns the contacts_person as @contact" do
        person = create(:contact_person)
        put :update, {:id => person.to_param, :contacts_person => invalid_attributes}, valid_session
        expect(assigns(:contact)).to eq(person)
      end

      it "re-renders the 'edit' template" do
        person = create(:contact_person)
        put :update, {:id => person.to_param, :contacts_person => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contacts_person" do
      person = create(:contact_person)
      expect {
        delete :destroy, {:id => person.to_param}, valid_session
      }.to change(Contacts::Person, :count).by(-1)
    end

    it "redirects to the contacts_people list" do
      person = create(:contact_person)
      delete :destroy, {:id => person.to_param}, valid_session
      expect(response).to redirect_to(contacts_url)
    end
  end

end

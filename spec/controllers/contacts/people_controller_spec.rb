require 'rails_helper'

RSpec.describe Contacts::PeopleController, type: :controller do

  let(:valid_attributes) {
    attributes_for :contact_person
  }

  let(:invalid_attributes) {
    attributes_for :contact_person, name: nil
  }

  let(:valid_session) { {} }

  before do
    user_signed_in
  end

  describe "GET #index" do
    it "assigns all contacts_people as @contacts_people" do
      person = Contacts::Person.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:contacts_people)).to eq([person])
    end
  end

  describe "GET #show" do
    it "assigns the requested contacts_person as @contacts_person" do
      person = Contacts::Person.create! valid_attributes
      get :show, {:id => person.to_param}, valid_session
      expect(assigns(:contacts_person)).to eq(person)
    end
  end

  describe "GET #new" do
    it "assigns a new contacts_person as @contacts_person" do
      get :new, {}, valid_session
      expect(assigns(:contacts_person)).to be_a_new(Contacts::Person)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contacts_person as @contacts_person" do
      person = Contacts::Person.create! valid_attributes
      get :edit, {:id => person.to_param}, valid_session
      expect(assigns(:contacts_person)).to eq(person)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contacts::Person" do
        expect {
          post :create, {:contacts_person => valid_attributes}, valid_session
        }.to change(Contacts::Person, :count).by(1)
      end

      it "assigns a newly created contacts_person as @contacts_person" do
        post :create, {:contacts_person => valid_attributes}, valid_session
        expect(assigns(:contacts_person)).to be_a(Contacts::Person)
        expect(assigns(:contacts_person)).to be_persisted
      end

      it "redirects to the created contacts_person" do
        post :create, {:contacts_person => valid_attributes}, valid_session
        expect(response).to redirect_to(Contacts::Person.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contacts_person as @contacts_person" do
        post :create, {:contacts_person => invalid_attributes}, valid_session
        expect(assigns(:contacts_person)).to be_a_new(Contacts::Person)
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
        person = Contacts::Person.create! valid_attributes
        put :update, {:id => person.to_param, :contacts_person => new_attributes}, valid_session
        person.reload
        expect(person.name).to eq new_attributes[:name]
      end

      it "assigns the requested contacts_person as @contacts_person" do
        person = Contacts::Person.create! valid_attributes
        put :update, {:id => person.to_param, :contacts_person => valid_attributes}, valid_session
        expect(assigns(:contacts_person)).to eq(person)
      end

      it "redirects to the contacts_person" do
        person = Contacts::Person.create! valid_attributes
        put :update, {:id => person.to_param, :contacts_person => valid_attributes}, valid_session
        expect(response).to redirect_to(person)
      end
    end

    context "with invalid params" do
      it "assigns the contacts_person as @contacts_person" do
        person = Contacts::Person.create! valid_attributes
        put :update, {:id => person.to_param, :contacts_person => invalid_attributes}, valid_session
        expect(assigns(:contacts_person)).to eq(person)
      end

      it "re-renders the 'edit' template" do
        person = Contacts::Person.create! valid_attributes
        put :update, {:id => person.to_param, :contacts_person => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contacts_person" do
      person = Contacts::Person.create! valid_attributes
      expect {
        delete :destroy, {:id => person.to_param}, valid_session
      }.to change(Contacts::Person, :count).by(-1)
    end

    it "redirects to the contacts_people list" do
      person = Contacts::Person.create! valid_attributes
      delete :destroy, {:id => person.to_param}, valid_session
      expect(response).to redirect_to(contacts_people_url)
    end
  end

end

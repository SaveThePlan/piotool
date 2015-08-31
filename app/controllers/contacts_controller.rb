class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.order(:name, :first_name).page(params[:page])
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contacts_company_params
    Contacts::Company.permits_params params.require(:contacts_company)
  end

  def contacts_person_params
    Contacts::Person.permits_params(params.require(:contacts_person))
  end

end

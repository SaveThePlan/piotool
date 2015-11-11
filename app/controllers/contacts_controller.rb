class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts

    @search_scope = (search_in_params?) ? params[:options][:search].to_s : nil
    @searchable_fields = %w(name first_name email activity)
    @search_field = if search_field_in_params? && @searchable_fields.include?(params[:options][:search_field].to_s)
                      params[:options][:search_field].to_sym
                    else
                      nil
                    end
    if @search_scope
      @contacts = (@search_field) ? @contacts.search(@search_scope, [@search_field]) : @contacts.search(@search_scope)
    end

    @contacts = @contacts.order(:name, :first_name)
    @contacts = @contacts.page(params[:page])
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

  def search_in_params?
    options_params? && params[:options][:search] && !params[:options][:search].blank?
  end

  def search_field_in_params?
    options_params? && params[:options][:search_field] && !params[:options][:search_field].blank?
  end

  def options_params?
    params && params[:options]
  end

end

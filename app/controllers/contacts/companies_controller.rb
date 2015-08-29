class Contacts::CompaniesController < ApplicationController
  before_action :set_contacts_company, only: [:show, :edit, :update, :destroy]

  # GET /contacts/companies
  # GET /contacts/companies.json
  def index
    @contacts_companies = Contacts::Company.all
  end

  # GET /contacts/companies/1
  # GET /contacts/companies/1.json
  def show
  end

  # GET /contacts/companies/new
  def new
    @contacts_company = Contacts::Company.new
  end

  # GET /contacts/companies/1/edit
  def edit
  end

  # POST /contacts/companies
  # POST /contacts/companies.json
  def create
    @contacts_company = Contacts::Company.new(contacts_company_params.merge(user: current_user))

    respond_to do |format|
      if @contacts_company.save
        format.html { redirect_to @contacts_company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @contacts_company }
      else
        format.html { render :new }
        format.json { render json: @contacts_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/companies/1
  # PATCH/PUT /contacts/companies/1.json
  def update
    respond_to do |format|
      if @contacts_company.update(contacts_company_params)
        format.html { redirect_to @contacts_company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @contacts_company }
      else
        format.html { render :edit }
        format.json { render json: @contacts_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/companies/1
  # DELETE /contacts/companies/1.json
  def destroy
    @contacts_company.destroy
    respond_to do |format|
      format.html { redirect_to contacts_companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacts_company
      @contacts_company = Contacts::Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contacts_company_params
      Contacts::Company.permits_params params.require(:contacts_company)
    end
end

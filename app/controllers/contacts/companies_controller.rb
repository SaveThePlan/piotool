class Contacts::CompaniesController < ContactsController

  # GET /contacts/companies/1
  # GET /contacts/companies/1.json
  def show
    @notes = @contact.notes
  end

  # GET /contacts/companies/new
  def new
    @contact = Contacts::Company.new
  end

  # GET /contacts/companies/1/edit
  def edit
  end

  # POST /contacts/companies
  # POST /contacts/companies.json
  def create
    @contact = Contacts::Company.new(contacts_company_params.merge(user: current_user))

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: t('controllers.contacts.companies.create.success') }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/companies/1
  # PATCH/PUT /contacts/companies/1.json
  def update
    respond_to do |format|
      if @contact.update(contacts_company_params)
        format.html { redirect_to @contact, notice: t('controllers.contacts.companies.update.success') }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/companies/1
  # DELETE /contacts/companies/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: t('controllers.contacts.companies.destroy.success') }
      format.json { head :no_content }
    end
  end

end

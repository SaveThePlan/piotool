class Contacts::PeopleController < ContactsController

  # GET /contacts/people/1
  # GET /contacts/people/1.json
  def show
  end

  # GET /contacts/people/new
  def new
    @contact = Contacts::Person.new
    set_company
  end

  # GET /contacts/people/1/edit
  def edit
    set_company
  end

  # POST /contacts/people
  # POST /contacts/people.json
  def create
    @contact = Contacts::Person.new(contacts_person_params.merge(user: current_user))
    company = Contacts::Company.new(contacts_company_params.merge(user: current_user)) if params[:contacts_company]
    @contact.company = company if @contact.company.nil? && !company.nil? && company.valid?

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/people/1
  # PATCH/PUT /contacts/people/1.json
  def update
    @contact.assign_attributes contacts_person_params

    company = Contacts::Company.new(contacts_company_params.merge(user: current_user)) if params[:contacts_company]
    @contact.company = company if @contact.company.nil? && !company.nil? && company.valid?

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/people/1
  # DELETE /contacts/people/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @companies = Contacts::Company.order(:name)
    @company = @contact.company || Contacts::Company.new
  end

end

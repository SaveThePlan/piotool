class Contacts::PeopleController < ContactsController

  # GET /contacts/people/1
  # GET /contacts/people/1.json
  def show
  end

  # GET /contacts/people/new
  def new
    @contact = Contacts::Person.new
  end

  # GET /contacts/people/1/edit
  def edit
  end

  # POST /contacts/people
  # POST /contacts/people.json
  def create
    @contact = Contacts::Person.new(contacts_person_params.merge(user: current_user))

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
    respond_to do |format|
      if @contact.update(contacts_person_params)
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

end

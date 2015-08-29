class Contacts::PeopleController < ApplicationController
  before_action :set_contacts_person, only: [:show, :edit, :update, :destroy]

  # GET /contacts/people
  # GET /contacts/people.json
  def index
    @contacts_people = Contacts::Person.all
  end

  # GET /contacts/people/1
  # GET /contacts/people/1.json
  def show
  end

  # GET /contacts/people/new
  def new
    @contacts_person = Contacts::Person.new
  end

  # GET /contacts/people/1/edit
  def edit
  end

  # POST /contacts/people
  # POST /contacts/people.json
  def create
    @contacts_person = Contacts::Person.new(contacts_person_params)

    respond_to do |format|
      if @contacts_person.save
        format.html { redirect_to @contacts_person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @contacts_person }
      else
        format.html { render :new }
        format.json { render json: @contacts_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/people/1
  # PATCH/PUT /contacts/people/1.json
  def update
    respond_to do |format|
      if @contacts_person.update(contacts_person_params)
        format.html { redirect_to @contacts_person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @contacts_person }
      else
        format.html { render :edit }
        format.json { render json: @contacts_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/people/1
  # DELETE /contacts/people/1.json
  def destroy
    @contacts_person.destroy
    respond_to do |format|
      format.html { redirect_to contacts_people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacts_person
      @contacts_person = Contacts::Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contacts_person_params
      params.require(:contacts_person).permit(:name, :email, :address, :phone, :website, :mobile, :job)
    end
end

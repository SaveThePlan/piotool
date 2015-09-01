class Notes::PersonalsController < ApplicationController
  before_action :set_notes_personal, only: [:show, :edit, :update, :destroy]

  # GET /notes/personals
  # GET /notes/personals.json
  def index
    @notes = Notes::Personal.all
  end

  # GET /notes/personals/1
  # GET /notes/personals/1.json
  def show
  end

  # GET /notes/personals/new
  def new
    @note = Notes::Personal.new
  end

  # GET /notes/personals/1/edit
  def edit
  end

  # POST /notes/personals
  # POST /notes/personals.json
  def create
    @note = Notes::Personal.new(notes_personal_params.merge(user: current_user))

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Personal was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/personals/1
  # PATCH/PUT /notes/personals/1.json
  def update
    respond_to do |format|
      if @note.update(notes_personal_params)
        format.html { redirect_to @note, notice: 'Personal was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/personals/1
  # DELETE /notes/personals/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_personals_url, notice: 'Personal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes_personal
      @note = Notes::Personal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notes_personal_params
      Notes::Personal.permits_params params.require(:notes_personal)
    end
end

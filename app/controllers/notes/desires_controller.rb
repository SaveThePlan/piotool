class Notes::DesiresController < ApplicationController
  before_action :set_notes_desire, only: [:show, :edit, :update, :destroy]

  # GET /notes/desires
  # GET /notes/desires.json
  def index
    @notes = Notes::Desire.all
  end

  # GET /notes/desires/1
  # GET /notes/desires/1.json
  def show
  end

  # GET /notes/desires/new
  def new
    @note = Notes::Desire.new
  end

  # GET /notes/desires/1/edit
  def edit
  end

  # POST /notes/desires
  # POST /notes/desires.json
  def create
    @note = Notes::Desire.new(notes_desire_params.merge(user: current_user))

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Desire was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/desires/1
  # PATCH/PUT /notes/desires/1.json
  def update
    respond_to do |format|
      if @note.update(notes_desire_params)
        format.html { redirect_to @note, notice: 'Desire was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/desires/1
  # DELETE /notes/desires/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_desires_url, notice: 'Desire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_notes_desire
    @note = Notes::Desire.find(params[:id])
  end

  def notes_desire_params
    Notes::Desire.permits_params params.require(:notes_desire)
  end
end

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = current_user.notes.page(params[:page])
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/new/:contact_id
  def new_for_contact
    @note = Note.new
    @contact_id = params[:contact_id]
    render :new
  end

  # GET /notes/1/edit
  def edit
    @contacts = current_user.contacts
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params.merge(user: current_user))
    @contact = Contact.find_by(id: params[:note][:contact_id])
    @note.contacts << @contact if @contact

    respond_to do |format|
      if @note.save
        format.html do
          flash[:notice] = t('controllers.notes.create.success')
          redirect_to @note
        end
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html do
          flash[:notice] = t('controllers.notes.update.success')
          redirect_to @note
        end
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: t('controllers.notes.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    Note.permits_params(params.require(:note))
  end

end

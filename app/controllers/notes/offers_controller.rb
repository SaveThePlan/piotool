class Notes::OffersController < ApplicationController
  before_action :set_notes_offer, only: [:show, :edit, :update, :destroy]

  # GET /notes/offers
  # GET /notes/offers.json
  def index
    @notes = Notes::Offer.all
  end

  # GET /notes/offers/1
  # GET /notes/offers/1.json
  def show
  end

  # GET /notes/offers/new
  def new
    @note = Notes::Offer.new
  end

  # GET /notes/offers/1/edit
  def edit
  end

  # POST /notes/offers
  # POST /notes/offers.json
  def create
    @note = Notes::Offer.new(notes_offer_params.merge(user: current_user))

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/offers/1
  # PATCH/PUT /notes/offers/1.json
  def update
    respond_to do |format|
      if @note.update(notes_offer_params)
        format.html { redirect_to @note, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/offers/1
  # DELETE /notes/offers/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_notes_offer
    @note = Notes::Offer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notes_offer_params
    Notes::Offer.permits_params params.require(:notes_offer)
  end
end

class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = current_user.favorites

    @favorites = @favorites.page(params[:page])
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(favorite_params.merge(user: current_user))

    respond_to do |format|
      if @favorite.save
        format.html do
          flash[:notice] = t('controllers.favorites.create.success')
          redirect_to @favorite
        end
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html do
          flash[:notice] = t('controllers.favorites.update.success')
          redirect_to @favorite
        end
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: t('controllers.favorites.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    Favorite.permits_params(params.require(:favorite))
  end

end

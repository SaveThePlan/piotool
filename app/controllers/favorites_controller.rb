class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = current_user.favorites

    @search_scope = (search_in_params?) ? params[:options][:search].to_s : nil
    if @search_scope
      @favorites = @favorites.search(@search_scope)
    end

    @order_fields = %w(title url created_at)
    @selected_order = (order_in_params? && @order_fields.include?(params[:options][:order].to_s)) ? params[:options][:order].to_s : 'title'

    @sorts = %w(asc desc)
    @selected_sort = (sort_in_params? && @sorts.include?(params[:options][:sort].to_s)) ? params[:options][:sort].to_s : 'asc'

    #nullify empty string fields (but string type only)
    @favorites = if %w(title url).include?(@selected_order)
                   @favorites.order("NULLIF(#{@selected_order},'') #{@selected_sort} NULLS LAST")
                 else
                   @favorites.order("#{@selected_order} #{@selected_sort} NULLS LAST")
                 end

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

  def search_in_params?
    options_params? && params[:options][:search] && !params[:options][:search].blank?
  end

  def order_in_params?
    options_params? && params[:options][:order] && !params[:options][:order].blank?
  end

  def sort_in_params?
    options_params? && params[:options][:sort] && !params[:options][:sort].blank?
  end

  def options_params?
    params && params[:options]
  end

end

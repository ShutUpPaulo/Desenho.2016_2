# Ingredients Controller
class IngredientsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # Authentication and Authorization hacks
  # before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.search(params[:search]).order(sort_column + ' ' +
    sort_direction).paginate(per_page: 5, page: params[:page])
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    respond_to do |format|
      if @ingredient.save
        format.html do
          redirect_to @ingredient, notice: 'Ingrediente criado com sucesso'
        end
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json do
          render json: @ingredient.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html do
          redirect_to @ingredient,
                      notice: 'Ingrediente atualizado com sucesso'
        end
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json do
          render json: @ingredient.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html do
        redirect_to ingredients_url,
                    notice: 'Ingrediente excluído com sucesso'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  # Never trust params from the scary net, only allow the white list through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end

  def sort_column
    Ingredient.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end
end

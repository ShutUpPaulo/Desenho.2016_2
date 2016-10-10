# Ingredients Controller
class IngredientsController < ApplicationController
  # Authentication and Authorization hacks
  # before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
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
          redirect_to @ingredient,
                      notice: 'Ingredient was successfully created.'
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
                      notice: 'Ingredient was successfully updated.'
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
                    notice: 'Ingredient was successfully destroyed.'
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
end

# Recipes Controller
class RecipesController < ApplicationController
  # Authentication and Authorization hacks
  # before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = if params[:tag]
                 Recipe.tagged_with(params[:tag])
               else
                 Recipe.all
               end
  end

  def tags
    @tags = Recipe.tag_counts
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/type
  def type
  end

  # POST /recipes/type
  def post_type
    @@recipes_builder = nil
    @@recipes_builder = choose_builder(params[:number])
    redirect_to '/recipes/new'
  end

  # GET /recipes/new
  def new
    @recipes_builder = @@recipes_builder
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    recipes_builder = @@recipes_builder
    recipes_builder.build_recipe(recipe_params)
    @recipe = recipes_builder.recipe

    # FIXME: linking ingredients to recipes the wrong way
    @recipe.ingredients << Ingredient.first unless Ingredient.all.empty?

    respond_to do |format|
      if @recipe.save
        format.html do
          redirect_to @recipe, notice: 'Recipe was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe }
        current_user.recipes << @recipe
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html do
          redirect_to @recipe,
                      notice: 'Recipe was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json do
          render json: @recipe.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to recipes_url,
                    notice: 'Recipe was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust params from the scary net, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name,
                                   :description,
                                   :instructions,
                                   :tag_list)
  end

  # Choose Builder
  def choose_builder(type)
    if type == '1'
      MainPlateBuilder.new
    elsif type == '2'
      AccompanimentBuilder.new
    elsif type == '3'
      DessertBuilder.new
    else
      DrinkBuilder.new
    end
  end
end

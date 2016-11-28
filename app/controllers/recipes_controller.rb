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

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  # GET /recipes/1/edit
  def edit
    @ingredients = Ingredient.all
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html do
          redirect_to recipe_path(@recipe), notice: 'Receita criada com sucesso'
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
                      notice: 'Receita atualizada com sucesso'
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
                    notice: 'Receita excluída com sucesso'
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
                                   :tag_list,
                                   ingredient_ids: [])
  end
end

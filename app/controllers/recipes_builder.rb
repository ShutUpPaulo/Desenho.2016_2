# RecipesBuilder Class
class RecipesBuilder
  attr_reader :recipe

  def initialize
    @recipe = Recipe.new
    build_recipe_type
  end

  def build_name(name)
    @recipe.name = name
  end

  def build_description(description)
    @recipe.description = description
  end

  def build_instructions(instructions)
    @recipe.instructions = instructions
  end

  def build_tag_list(tag_list)
    @recipe.tag_list = tag_list
  end

  def build_recipe_type
  end

  def build_recommended_recipes
  end

  # Build recipe
  def build_recipe(recipe_params)
    build_name(recipe_params[:name])
    build_description(recipe_params[:description])
    build_instructions(recipe_params[:instructions])
    build_tag_list(recipe_params[:tag_list])
    build_recipe_type
    build_recommended_recipes
  end
end

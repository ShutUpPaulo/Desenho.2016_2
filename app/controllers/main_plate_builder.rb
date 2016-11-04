# MainPlateBuilder Class
class MainPlateBuilder < RecipesBuilder
  def build_recipe_type
    @recipe.recipe_type = 'Main Plate'
  end

  def build_recommended_recipes
  end
end

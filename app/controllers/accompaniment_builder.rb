# AccompanimentBuilder Class
class AccompanimentBuilder < RecipesBuilder
  def build_recipe_type
    @recipe.recipe_type = 'Accompaniment'
  end

  def build_recommended_recipes
  end
end

# DrinkBuilder Class
class DrinkBuilder < RecipesBuilder
  def build_recipe_type
    @recipe.recipe_type = 'Drink'
  end

  def build_recommended_recipes
  end
end

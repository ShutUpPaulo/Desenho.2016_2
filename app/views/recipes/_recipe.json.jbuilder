json.extract! recipe, :id, :recipeName, :recipeDescriptions, :recipeInstructions, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
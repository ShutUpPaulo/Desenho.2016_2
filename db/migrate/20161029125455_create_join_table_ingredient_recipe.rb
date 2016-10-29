# Join table for recipes and ingredients
class CreateJoinTableIngredientRecipe < ActiveRecord::Migration
  def change
    create_join_table :ingredients, :recipes do |t|
      t.index [:ingredient_id, :recipe_id]
    end
  end
end

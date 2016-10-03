class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipeName
      t.string :recipeDescriptions
      t.string :recipeInstructions

      t.timestamps null: false
    end
  end
end

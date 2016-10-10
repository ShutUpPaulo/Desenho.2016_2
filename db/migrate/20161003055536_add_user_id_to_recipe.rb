# Add field in table Recipe for tracking its owner
class AddUserIdToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :user, index: true, foreign_key: true
  end
end

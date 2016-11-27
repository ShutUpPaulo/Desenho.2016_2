# Static Pages Controller
class PagesController < ApplicationController
  def index
    @user = User.new
    @ingredients = Ingredient.all
    @recipes = Recipe.all
  end

  def about
  end
end

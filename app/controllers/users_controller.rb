# Users controller
class UsersController < ApplicationController
  def show
    @recipes = current_user.recipes
  end
end

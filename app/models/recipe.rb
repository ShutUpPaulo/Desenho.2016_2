# Recipe model
class Recipe < ActiveRecord::Base
  # Associate users and recipes
  belongs_to :user
end

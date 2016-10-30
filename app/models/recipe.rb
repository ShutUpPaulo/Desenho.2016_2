# Recipe model
class Recipe < ActiveRecord::Base
  # Associate users and recipes
  belongs_to :user

  # Associate recipes and ingredients
  has_and_belongs_to_many :ingredients

  acts_as_taggable
end

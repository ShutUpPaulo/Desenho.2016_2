# Ingredient model
class Ingredient < ActiveRecord::Base
  # Associate ingredients and recipes
  has_and_belongs_to_many :recipes

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end
end

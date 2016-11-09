require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'saves a valid recipe' do
    #pending: Add proper validations to Recipe model
    # recipe can save even with blank fields...
    recipe = Recipe.new
    expect(recipe.validate).to eq(true)
    expect(recipe.save).to eq(true)
  end

  it 'acts as taggable' do
    recipe = Recipe.create!

    recipe.tag_list.add 'first'
    recipe.tag_list.add 'second'

    recipe.save!
    expect(recipe.tag_list).to eq(['first', 'second'])
  end
end

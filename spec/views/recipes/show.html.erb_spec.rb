require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(name: 'Name',
                                             description: 'description',
                                             instructions: 'Instructions'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/description/)
    expect(rendered).to match(/Instructions/)
  end
end

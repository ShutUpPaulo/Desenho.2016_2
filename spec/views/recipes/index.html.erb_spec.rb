require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:recipes, [Recipe.create!(name: 'Name',
                                     description: 'description',
                                     instructions: 'Instructions'),
                      Recipe.create!(name: 'Name',
                                     description: 'description',
                                     instructions: 'Instructions')])
  end

  it 'renders a list of recipes' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'description'.to_s, count: 2
    assert_select 'tr>td', text: 'Instructions'.to_s, count: 2
  end
end

require 'rails_helper'

RSpec.describe 'ingredients/index', type: :view do
  before(:each) do
    assign(:ingredients,
           [Ingredient.create!(name: 'Name', description: 'Description'),
            Ingredient.create!(name: 'Name', description: 'Description')])
  end

  it 'renders a list of ingredients' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
  end
end

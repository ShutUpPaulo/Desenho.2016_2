require 'rails_helper'

RSpec.describe 'ingredients/edit', type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(name: 'MyStr',
                                                         description: 'MyStr'))
  end

  it 'renders the edit ingredient form' do
    render
    assert_select 'form[action=?][method=?]',
                  ingredient_path(@ingredient),
                  'post' do
      assert_select 'input#ingredient_name[name=?]', 'ingredient[name]'
      assert_select 'input#ingredient_description[name=?]',
                    'ingredient[description]'
    end
  end
end

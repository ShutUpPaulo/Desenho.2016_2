require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before :each do
    Ingredient.destroy_all

    ["acucar", "tempero", "tudo de bom"].each do |name|
      Ingredient.create! :name=>name
    end
  end

  it 'saves a valid ingredient' do
    i = Ingredient.new
    expect(i.validate).to eq(true)
    expect(i.save).to eq(true)
  end

  describe 'Ingredient.search' do
    it 'search by name' do
      ingredients = Ingredient.search('o').sort

      expect(ingredients.count).to eq(2)
      expect(ingredients.map(&:name)).to eq(["tempero", "tudo de bom"])
    end

    it "retuns all elements if name isn't given" do
      ingredients = Ingredient.search(nil)

      expect(ingredients.count).to eq(Ingredient.count)
    end
  end
end

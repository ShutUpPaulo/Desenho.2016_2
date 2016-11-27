class IngredientsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Ingredient.count,
      iTotalDisplayRecords: ingredients.total_entries,
      aaData: data
    }
  end

private

  def data
    ingredients.map do |ingredient|
      [
        link_to(ingredient.name, ingredient)
      ]
    end
  end

  def ingredients
    @ingredients ||= fetch_ingredients
  end

  def fetch_ingredients
    ingredients = Ingredient.order("#{sort_column} #{sort_direction}")
    ingredients = ingredients.page(page).per_page(per_page)
    if params[:sSearch].present?
      ingredients = ingredients.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    ingredients
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

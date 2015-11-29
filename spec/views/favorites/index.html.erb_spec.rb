require 'rails_helper'

RSpec.describe "favorites/index", type: :view do
  before(:each) do
    create_list :favorite, 2
    assign(:favorites, Favorite.page(1))

    assign(:search_scope, nil)
    assign(:order_fields, %w(title url created_at))
    assign(:selected_order, 'title')
    assign(:sorts, %w(asc desc))
    assign(:selected_sort, 'asc')
  end

  it "renders" do
    render
  end
end

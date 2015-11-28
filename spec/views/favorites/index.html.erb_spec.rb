require 'rails_helper'

RSpec.describe "favorites/index", type: :view do
  before(:each) do
    create_list :favorite, 2
    assign(:favorites, Favorite.page(1))
  end

  it "renders" do
    render
  end
end

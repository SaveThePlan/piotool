require 'rails_helper'

RSpec.describe "favorites/edit", type: :view do
  before(:each) do
    @favorite = assign(:favorite, create(:favorite))
  end

  it "renders" do
    render
  end
end

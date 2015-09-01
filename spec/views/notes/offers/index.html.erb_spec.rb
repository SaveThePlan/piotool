require 'rails_helper'

RSpec.describe "notes/offers/index", type: :view do
  before(:each) do
    assign(:notes, create_list(:note_offer, 2))
  end

  it "renders" do
    render
  end
end

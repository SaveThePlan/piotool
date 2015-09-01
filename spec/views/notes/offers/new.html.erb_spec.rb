require 'rails_helper'

RSpec.describe "notes/offers/new", type: :view do
  before(:each) do
    assign(:note, Notes::Offer.new())
  end

  it "renders" do
    render
  end
end

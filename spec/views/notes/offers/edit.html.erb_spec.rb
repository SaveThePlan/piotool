require 'rails_helper'

RSpec.describe "notes/offers/edit", type: :view do
  before(:each) do
    @note = assign(:notes_offer, create(:note_offer))
  end

  it "renders" do
    render
  end
end

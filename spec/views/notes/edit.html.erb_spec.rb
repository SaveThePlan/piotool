require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, create(:note, contact: create(:contact_company)))
  end

  it "renders" do
    render
  end
end

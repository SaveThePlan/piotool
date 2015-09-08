require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, create(:note_with_contact_notes))
  end

  it "renders" do
    render
  end
end

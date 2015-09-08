require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, create(:note_with_contact_notes))
  end

  it "renders" do
    render
  end
end

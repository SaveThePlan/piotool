require 'rails_helper'

RSpec.describe "notes/desires/edit", type: :view do
  before(:each) do
    @note = assign(:note, create(:note_desire))
  end

  it "renders" do
    render
  end
end

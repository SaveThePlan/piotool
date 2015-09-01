require 'rails_helper'

RSpec.describe "notes/personals/edit", type: :view do
  before(:each) do
    @note = assign(:note, create(:note_personal))
  end

  it "renders" do
    render
  end
end

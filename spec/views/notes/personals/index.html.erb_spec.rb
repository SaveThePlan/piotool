require 'rails_helper'

RSpec.describe "notes/personals/index", type: :view do
  before(:each) do
    assign(:notes, create_list(:note_personal, 2))
  end

  it "renders" do
    render
  end
end

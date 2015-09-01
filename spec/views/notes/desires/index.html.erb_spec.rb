require 'rails_helper'

RSpec.describe "notes/desires/index", type: :view do
  before(:each) do
    assign(:notes, create_list(:note_desire, 2))
  end

  it "renders" do
    render
  end
end

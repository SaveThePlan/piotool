require 'rails_helper'

RSpec.describe "notes/desires/new", type: :view do
  before(:each) do
    assign(:note, Notes::Desire.new())
  end

  it "renders" do
    render
  end
end

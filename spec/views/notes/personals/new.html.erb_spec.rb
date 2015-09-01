require 'rails_helper'

RSpec.describe "notes/personals/new", type: :view do
  before(:each) do
    assign(:note, Notes::Personal.new())
  end

  it "renders" do
    render
  end
end

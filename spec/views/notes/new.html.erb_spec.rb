require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new)
    assign(:contacts, create_list(:contact, 2))
  end

  it "renders" do
    render
  end
end

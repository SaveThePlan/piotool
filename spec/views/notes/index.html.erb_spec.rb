require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    create_list :note, 2
    assign(:notes, Note.page(1))
    assign(:search_scope, nil)
  end

  it "renders" do
    render
  end
end

require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    create_list :note, 2
    assign(:notes, Note.page(1))
    assign(:search_scope, nil)
    assign(:order_fields, %w(content created_at updated_at))
    assign(:selected_order, 'created_at')
    assign(:sorts, %w(asc desc))
    assign(:selected_sort, 'asc')
  end

  it "renders" do
    render
  end
end

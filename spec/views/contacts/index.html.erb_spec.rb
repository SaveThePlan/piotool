require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    create :contact_person
    create :contact_company
    assign(:contacts, Contact.page(1))
    assign(:search_scope, nil)
    assign(:searchable_fields, %w(name first_name email activity))
    assign(:selected_order, 'name')
    assign(:sorts, %w(asc desc))
    assign(:selected_sort, 'asc')
  end

  it "renders" do
    render
  end
end

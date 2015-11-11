require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    create :contact_person
    create :contact_company
    assign(:contacts, Contact.page(1))
    assign(:search_scope, nil)
    assign(:searchable_fields, %w(name first_name email activity))
  end

  it "renders" do
    render
  end
end

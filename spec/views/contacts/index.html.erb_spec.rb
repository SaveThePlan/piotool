require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    create :contact_person
    create :contact_company
    assign(:contacts, Contact.all)
  end

  it "renders" do
    render
  end
end

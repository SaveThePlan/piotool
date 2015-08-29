require 'rails_helper'

RSpec.describe "contacts/companies/index", type: :view do
  before(:each) do
    assign(:contacts_companies, create_list(:contact_company, 2))
  end

  it "renders" do
    render
  end
end

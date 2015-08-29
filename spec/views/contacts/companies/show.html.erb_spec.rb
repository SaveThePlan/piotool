require 'rails_helper'

RSpec.describe "contacts/companies/show", type: :view do
  before(:each) do
    @contacts_company = assign(:contacts_company, create(:contact_company))
  end

  it "renders" do
    render
  end
end

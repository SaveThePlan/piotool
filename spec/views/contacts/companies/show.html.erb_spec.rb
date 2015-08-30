require 'rails_helper'

RSpec.describe "contacts/companies/show", type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact_company))
  end

  it "renders" do
    render
  end
end

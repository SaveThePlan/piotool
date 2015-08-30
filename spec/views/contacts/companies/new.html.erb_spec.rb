require 'rails_helper'

RSpec.describe "contacts/companies/new", type: :view do
  before(:each) do
    assign(:contact, Contacts::Company.new)
  end

  it "renders" do
    render
  end
end

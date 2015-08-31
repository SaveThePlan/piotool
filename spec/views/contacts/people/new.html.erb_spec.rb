require 'rails_helper'

RSpec.describe "contacts/people/new", type: :view do
  before(:each) do
    assign(:contact, Contacts::Person.new)
    assign(:company, Contacts::Company.new)
  end

  it "renders" do
    render
  end
end

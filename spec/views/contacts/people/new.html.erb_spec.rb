require 'rails_helper'

RSpec.describe "contacts/people/new", type: :view do
  before(:each) do
    assign(:contacts_person, Contacts::Person.new)
  end

  it "renders" do
    render
  end
end

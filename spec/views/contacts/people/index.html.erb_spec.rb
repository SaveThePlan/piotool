require 'rails_helper'

RSpec.describe "contacts/people/index", type: :view do
  before(:each) do
    assign(:contacts_people, create_list(:contact_person, 2))
  end

  it "renders" do
    render
  end
end

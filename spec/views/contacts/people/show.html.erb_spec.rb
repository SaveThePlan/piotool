require 'rails_helper'

RSpec.describe "contacts/people/show", type: :view do
  before(:each) do
    @contacts_person = assign(:contacts_person, create(:contact_person))
  end

  it "renders" do
    render
  end
end
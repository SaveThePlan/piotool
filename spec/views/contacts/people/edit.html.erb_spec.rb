require 'rails_helper'

RSpec.describe "contacts/people/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact_person))
  end

  it "renders" do
    render
  end
end

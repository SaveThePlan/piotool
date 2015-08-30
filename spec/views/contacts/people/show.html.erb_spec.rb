require 'rails_helper'

RSpec.describe "contacts/people/show", type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact_person))
  end

  it "renders" do
    render
  end
end

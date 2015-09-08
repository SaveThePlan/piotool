require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = create(:contact_company)
    create_list(:contact_note, 2, contact: @contact)
    assign(:contact, @contact)
  end

  it "renders" do
    render
  end
end

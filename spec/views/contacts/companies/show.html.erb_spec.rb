require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact_company))
    assign(:notes, create_list(:note, 2, contact: @contact))
  end

  it "renders" do
    render
  end
end

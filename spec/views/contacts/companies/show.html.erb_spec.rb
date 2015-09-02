require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact_company))
    assign(:desire_notes, create_list(:note, 2, kind: :desire, contact: @contact))
    assign(:offer_notes, create_list(:note, 2, kind: :offer, contact: @contact))
    assign(:personal_notes, create_list(:note, 2, kind: :personal, contact: @contact))
  end

  it "renders" do
    render
  end
end

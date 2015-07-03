require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact))
  end

  it "renders" do
    render
  end
end

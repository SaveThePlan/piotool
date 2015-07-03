require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, create(:contact))
  end

  it "renders" do
    render
  end
end

require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, create_list(:contact, 2))
  end

  it "renders" do
    render
  end
end
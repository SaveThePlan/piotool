require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, create(:note, contact:create(:contact_person)))
  end

  it "renders" do
    render
  end
end

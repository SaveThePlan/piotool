require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, create(:note))
  end

  it "renders" do
    render
  end
end

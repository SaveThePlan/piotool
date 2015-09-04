require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before(:each) do
    user_signed_in
  end

  it "renders" do
    render
  end
end

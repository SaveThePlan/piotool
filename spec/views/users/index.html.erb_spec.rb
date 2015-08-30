require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    create_list(:user, 2)
    assign(:users, User.page(1))
  end

  it "renders" do
    render
  end
end

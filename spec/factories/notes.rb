FactoryGirl.define do

  factory :note, class: Note do
    sequence(:title) {|n| "Title #{n}"}
    content "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    user
    contact
  end

end

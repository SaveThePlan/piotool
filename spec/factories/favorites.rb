FactoryGirl.define do

  factory :favorite, class: Favorite do
    sequence(:title) { |n| "Fav. #{n}" }
    content "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    url 'http://www.google.com'
    user
  end

end

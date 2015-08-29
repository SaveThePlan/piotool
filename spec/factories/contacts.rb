FactoryGirl.define do

  factory :contact, class: Contact do
    sequence(:name) { |n| "Nom contact #{n}" }
    sequence(:email) { |n| "contact#{n}@example.com" }
    address "1, Sunny street \n ZIP234 City"
    phone "+33 1 23 45 67 89"
    fax "+33 1 23 45 67 80"
    website "http://example.com"
    user
  end

end

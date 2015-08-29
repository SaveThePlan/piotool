FactoryGirl.define do

  factory :contact_person, class: Contacts::Person do
    sequence(:name) { |n| "Nom contact #{n}" }
    sequence(:email) { |n| "contact#{n}@example.com" }
    address "1, Sunny street \n ZIP234 City"
    phone "+33 1 23 45 67 89"
    fax "+33 1 23 45 67 80"
    website "http://example.com"
    mobile "+33 6 23 45 67 89"
    job "CEO"
  end

end

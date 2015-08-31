FactoryGirl.define do

  factory :contact_person, class: Contacts::Person do
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:name) { |n| "Nom contact #{n}" }
    sequence(:email) { |n| "contact#{n}@example.com" }
    address "1, Sunny street \n ZIP234 City"
    phone "+33 1 23 45 67 89"
    mobile "+33 6 23 45 67 89"
    job "CEO"
    user

    factory :contact_person_in_company do
      company { build(:contact_company) }
    end
  end

end

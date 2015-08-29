FactoryGirl.define do

  factory :contact_company, class: Contacts::Company do
    sequence(:name) { |n| "Nom company #{n}" }
    sequence(:email) { |n| "contact#{n}@example.com" }
    address "1, Sunny street \n ZIP234 City"
    phone "+33 1 23 45 67 89"
    fax "+33 1 23 45 67 80"
    website "http://example.com"
    siret "90876"
    tva "tva-124356"
    employees_count 12
    user
  end

end

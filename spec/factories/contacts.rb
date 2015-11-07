FactoryGirl.define do

  factory :contact, class: Contact do
    sequence(:name) { |n| "Nom contact #{n}" }
    sequence(:email) { |n| "contact#{n}@example.com" }
    address "1, Sunny street \n ZIP234 City"
    phone "+33 1 23 45 67 89"
    fax "+33 1 23 45 67 80"
    website "http://example.com"
    activity "an activity"
    notefield "a note"
    user

    factory :contact_with_notes do
      transient do
        notes_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:note, evaluator.notes_count, contact: obj)
      end
    end
  end

end

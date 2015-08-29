FactoryGirl.define do

  factory :user, class: User do
    sequence(:email) { |n| "janedoe#{n}@mail.fr" }

    after(:build) do |user, evaluator|
      user.password = user.password_confirmation = 'motdepasse'
    end

    factory :user_with_contacts do
      transient do
        contacts_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:contact, evaluator.contacts_count, user: obj)
      end
    end
  end

end

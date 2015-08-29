FactoryGirl.define do

  factory :user, class: User do
    sequence(:email) { |n| "janedoe#{n}@mail.fr" }

    after(:build) do |user, evaluator|
      user.password = user.password_confirmation = 'motdepasse'
    end

    # password 'motdepasse'
    # password_confirmation 'motdepasse'

  end

end

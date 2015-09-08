FactoryGirl.define do

  factory :note, class: Note do
    sequence(:title) {|n| "Title #{n}"}
    content "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    user

    factory :note_with_contact_notes do
      transient do
        contact_notes_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:contact_note, evaluator.contact_notes_count, note: obj)
      end
    end
  end

end

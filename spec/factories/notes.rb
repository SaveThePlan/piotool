FactoryGirl.define do

  factory :note, class: Note do
    content "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    user
    contact

    factory :note_desire, class: Notes::Desire do
    end

    factory :note_offer, class: Notes::Offer do
    end
  end

end

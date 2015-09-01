require 'rails_helper'

RSpec.describe Notes::Desire, type: :model do

  let(:b_note) { build :note_desire }

  context 'inheritance' do
    describe 'subclass Note' do
      it { expect(subject).to be_a Note }
    end

    describe 'keeps table_name' do
      it { expect(Notes::Desire.table_name).to eq Note.table_name }
    end
  end


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of user' do
      it { expect(b_note).to be_valid }
      it { expect(build :note_desire, user: nil).to_not be_valid }
    end
  end

end

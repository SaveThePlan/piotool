require 'rails_helper'

RSpec.describe Notes::Personal, type: :model do

  let(:b_note) { build :note_personal }

  context 'inheritance' do
    describe 'subclass Note' do
      it { expect(subject).to be_a Note }
    end

    describe 'keeps table_name' do
      it { expect(Notes::Personal.table_name).to eq Note.table_name }
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
      it { expect(build :note_personal, user: nil).to_not be_valid }
    end
  end

end

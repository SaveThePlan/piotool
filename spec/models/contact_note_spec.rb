require 'rails_helper'

RSpec.describe ContactNote, type: :model do

  let(:b_contact_note) { build :contact_note }


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of note' do
      it { expect(b_contact_note).to be_valid }
      it { expect(build :contact_note, note: nil).to_not be_valid }
    end

    describe 'presence of contact' do
      it { expect(b_contact_note).to be_valid }
      it { expect(build :contact_note, contact: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.note (belongs_to)' do
      subject { b_contact_note }
      it { expect(subject).to respond_to :note }
      it { expect(subject.note).to be_a Note }
    end

    describe '.contact (belongs_to)' do
      subject { b_contact_note }
      it { expect(subject).to respond_to :contact }
      it { expect(subject.contact).to be_a Contact }
    end
  end

end

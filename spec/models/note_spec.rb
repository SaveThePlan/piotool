require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:content) { "Hello I am the content" }

  let(:b_note) { build :note }
  let(:b_known_note) { build :note, content: content }


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of user' do
      it { expect(b_note).to be_valid }
      it { expect(build :note, user: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.user (belongs_to)' do
      subject { b_note }
      it { expect(subject).to respond_to :user }
      it { expect(subject.user).to be_a User }
    end

    describe '.contact (belongs_to)' do
      subject { b_note }
      it { expect(subject).to respond_to :contact }
      it { expect(subject.contact).to be_a Contact }
    end
  end


  context 'scopes' do
    describe '.search(text)' do
      let!(:searchString) { 'SearchText' }
      let!(:note_0) { create :note }
      let!(:note_1) { create :note, content: 'blmbla searchText' }
      let!(:note_2) { create :note, content: 'Searchtext blabla' }

      it { expect(Note).to respond_to(:search) }

      it 'find matching notes' do
        expect(Note.search(searchString)).to match_array [note_1, note_2]
      end
    end
  end


  context 'attributes' do
    subject { b_known_note }

    describe '.content' do
      it { should respond_to(:content) }
      it { expect(subject.content).to be_a String }
      it { expect(subject.content).to eq content }
    end
  end


  context 'scopes' do
    subject { b_known_note }

    describe '.unassociated' do
      it { expect(Note).to respond_to(:unassociated) }
      it 'find matching notes' do
        assoc_ok = create_list :note, 2
        assoc_ko = create_list :note, 2, contact: nil
        expect(Note.unassociated).to match_array assoc_ko
      end
    end
  end

end

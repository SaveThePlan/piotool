require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:b_note) { build :note }


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

    describe 'presence of title' do
      it { expect(b_note).to be_valid }
      it { expect(build :note, title: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.user (belongs_to)' do
      subject { b_note }
      it { expect(subject).to respond_to :user }
      it { expect(subject.user).to be_a User }
    end

    describe '.contact_notes (has_many)' do
      subject { create :note_with_contact_notes, contact_notes_count: 2 }
      it { expect(subject).to respond_to :contact_notes }
      it { expect(subject.contact_notes.length).to eq 2 }
      it { expect(subject.contact_notes.first).to be_a ContactNote }
    end

    describe '.contacts (has_many through contact_notes)' do
      subject { create :note_with_contact_notes, contact_notes_count: 2 }
      it { expect(subject).to respond_to :contacts }
      it { expect(subject.contacts.length).to eq 2 }
      it { expect(subject.contacts.first).to be_a Contact }
    end
  end


  context 'attributes' do
    let(:title) { "the title" }
    let(:content) { "Hello I am the content" }

    subject { build :note, content: content, title: title }

    describe '.content' do
      it { should respond_to(:content) }
      it { expect(subject.content).to be_a String }
      it { expect(subject.content).to eq content }
    end

    describe '.title' do
      it { should respond_to(:title) }
      it { expect(subject.title).to be_a String }
      it { expect(subject.title).to eq title }
    end
  end

end

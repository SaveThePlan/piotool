require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:title) { "the title" }
  let(:content) { "Hello I am the content" }

  let(:b_note) { build :note }
  let(:b_known_note) { build :note, content: content, title: title }


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

    describe '.contact (belongs_to)' do
      subject { b_note }
      it { expect(subject).to respond_to :contact }
      it { expect(subject.contact).to be_a Contact }
    end
  end


  context 'attributes' do
    subject { b_known_note }

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


  context 'scopes' do
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

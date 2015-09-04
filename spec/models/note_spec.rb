require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:content) { "Hello I am the content" }
  let(:kind) { :offer }

  let(:b_note) { build :note }
  let(:b_known_note) { build :note, content: content, kind: kind }


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

    describe 'presence of kind' do
      it { expect(b_note).to be_valid }
      it { expect(build :note, kind: nil).to_not be_valid }
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

    describe '.kind' do
      it { should respond_to(:kind) }
      it { expect(subject.kind).to be_a String }
      it { expect(subject.kind).to eq kind.to_s }
    end
  end


  context 'scopes' do
    subject { b_known_note }

    describe '.by_kind' do
      it { expect(Note).to respond_to(:by_kind) }
      it 'find matching kind notes' do
        desire = create :note, kind: :desire
        offer = create :note, kind: :offer
        expect(Note.by_kind(:offer)).to match_array [offer]
      end
    end

    describe '.offers' do
      it { expect(Note).to respond_to(:offers) }
      it 'call by_kind with :offer' do
        expect(Note).to receive(:by_kind).with(:offer)
        Note.offers
      end
    end

    describe '.desires' do
      it { expect(Note).to respond_to(:desires) }
      it 'call by_kind with :desire' do
        expect(Note).to receive(:by_kind).with(:desire)
        Note.desires
      end
    end

    describe '.personals' do
      it { expect(Note).to respond_to(:personals) }
      it 'call by_kind with :personal' do
        expect(Note).to receive(:by_kind).with(:personal)
        Note.personals
      end
    end

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

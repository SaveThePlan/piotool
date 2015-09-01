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

end

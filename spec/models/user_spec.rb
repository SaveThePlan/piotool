require 'rails_helper'

RSpec.describe User, type: :model do

  let(:list_count) { 2 }
  let(:email) { 'myemail@example.com' }
  let(:b_user) { build :user }
  let(:b_known_user) { build :user, email: email }
  let(:c_with_contacts) { create :user_with_contacts, contacts_count: list_count }


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of email' do
      it { expect(b_user).to be_valid }
      it { expect(build :user, email: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.contacts (has_many)' do
      subject { c_with_contacts }
      it { expect(subject).to respond_to :contacts }
      it { expect(subject.contacts.length).to eq list_count }
      it { expect(subject.contacts.first).to be_a Contact }
    end

    describe 'roles' do
      subject { create :user }

      describe '.add_role' do
        it { should respond_to(:add_role) }
      end

      describe '.has_role?' do
        before { subject.add_role :admin }
        it { should respond_to(:has_role?) }
        it { expect(subject.has_role? :admin).to be true }
        it { expect(subject.has_role? :wrong).to be false }
      end
    end
  end


  context 'attributes' do
    subject { b_known_user }

    describe '.email' do
      it { should respond_to(:email) }
      it { expect(subject.email).to be_a String }
      it { expect(subject.email).to eq email }
    end
  end

end

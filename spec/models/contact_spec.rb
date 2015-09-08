require 'rails_helper'

RSpec.describe Contact, type: :model do

  let(:b_contact) { build :contact }


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of name' do
      it { expect(b_contact).to be_valid }
      it { expect(build :contact, name: nil).to_not be_valid }
    end

    describe 'presence of user' do
      it { expect(b_contact).to be_valid }
      it { expect(build :contact, user: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.user (belongs_to)' do
      subject { b_contact }
      it { expect(subject).to respond_to :user }
      it { expect(subject.user).to be_a User }
    end

    describe '.contact_notes (has_many)' do
      subject { create :contact_with_contact_notes, contact_notes_count: 2 }
      it { expect(subject).to respond_to :contact_notes }
      it { expect(subject.contact_notes.length).to eq 2 }
      it { expect(subject.contact_notes.first).to be_a ContactNote }
    end

    describe '.notes (has_many through contact_notes)' do
      subject { create :contact_with_contact_notes, contact_notes_count: 2 }
      it { expect(subject).to respond_to :notes }
      it { expect(subject.notes.length).to eq 2 }
      it { expect(subject.notes.first).to be_a Note }
    end
  end


  context 'attributes' do
    let(:name) { "John Doe" }
    let(:email) { "john@example.com" }
    let(:address) { "A la croisee des chemins" }
    let(:phone) { "01 22 33 44 55" }
    let(:fax) { "01 22 33 44 00" }
    let(:website) { "http://website.com" }

    subject { build :contact, name: name, email: email, address: address, phone: phone, website: website, fax: fax }

    describe '.name' do
      it { should respond_to(:name) }
      it { expect(subject.name).to be_a String }
      it { expect(subject.name).to eq name }
    end

    describe '.email' do
      it { should respond_to(:email) }
      it { expect(subject.email).to be_a String }
      it { expect(subject.email).to eq email }
    end

    describe '.address' do
      it { should respond_to(:address) }
      it { expect(subject.address).to be_a String }
      it { expect(subject.address).to eq address }
    end

    describe '.phone' do
      it { should respond_to(:phone) }
      it { expect(subject.phone).to be_a String }
      it { expect(subject.phone).to eq phone }
    end

    describe '.fax' do
      it { should respond_to(:fax) }
      it { expect(subject.fax).to be_a String }
      it { expect(subject.fax).to eq fax }
    end

    describe '.website' do
      it { should respond_to(:website) }
      it { expect(subject.website).to be_a String }
      it { expect(subject.website).to eq website }
    end
  end

end

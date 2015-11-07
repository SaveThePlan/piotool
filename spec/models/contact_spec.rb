require 'rails_helper'

RSpec.describe Contact, type: :model do

  let(:list_count) { 2 }

  let(:name) { "John Doe" }
  let(:email) { "john@example.com" }
  let(:address) { "A la croisee des chemins" }
  let(:phone) { "01 22 33 44 55" }
  let(:fax) { "01 22 33 44 00" }
  let(:website) { "http://website.com" }
  let(:activity) { "dead man" }
  let(:notefield) { "Oh this is my note" }

  let(:b_contact) { build :contact }
  let(:b_known_contact) { build :contact,
                                name: name, email: email,
                                address: address, phone: phone, website: website, fax: fax,
                                activity: activity, notefield: notefield }

  let(:c_with_notes) { create :contact_with_notes, notes_count: list_count }


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

    describe '.notes (has_many)' do
      subject { c_with_notes }
      it { expect(subject).to respond_to :notes }
      it { expect(subject.notes.length).to eq list_count }
      it { expect(subject.notes.first).to be_a Note }
    end
  end


  context 'scopes' do
    describe '.search(text)' do
      it { expect(Contact).to respond_to(:search) }

      context 'find matching contacts' do
        let!(:searchString) { 'SearchText' }
        let!(:contact_0) { create :contact }
        let!(:contact_1) { create :contact, name: 'searchText' }
        let!(:contact_2) { create :contact, first_name: 'Searchtext' }
        let!(:contact_3) { create :contact, email: 'searchtext@example.com' }
        let!(:contact_4) { create :contact, activity: 'SEARCHTEXT' }

        it 'search in all fields' do
          expect(Contact.search(searchString)).to match_array [contact_1, contact_2, contact_3, contact_4]
        end

        it 'search in name only' do
          expect(Contact.search(searchString, [:name])).to match_array [contact_1]
        end

        it 'search in name + first_name only' do
          expect(Contact.search(searchString, [:name, :first_name])).to match_array [contact_1, contact_2]
        end
      end
    end
  end


  context 'attributes' do
    subject { b_known_contact }

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

    describe '.activity' do
      it { should respond_to(:activity) }
      it { expect(subject.activity).to be_a String }
      it { expect(subject.activity).to eq activity }
    end

    describe '.notefield' do
      it { should respond_to(:notefield) }
      it { expect(subject.notefield).to be_a String }
      it { expect(subject.notefield).to eq notefield }
    end
  end

end

require 'rails_helper'

RSpec.describe Contacts::Company, type: :model do

  let(:b_contact) { build :contact_company }


  context 'inheritance' do
    describe 'subclass Contact' do
      it { expect(subject).to be_a Contact }
    end

    describe 'keeps table_name' do
      it { expect(Contacts::Company.table_name).to eq Contact.table_name }
    end
  end


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of name' do
      it { expect(b_contact).to be_valid }
      it { expect(build :contact_company, name: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.people (has_many Contacts::Person)' do
      subject { create :contact_company_with_people, people_count: 2 }
      it { expect(subject).to respond_to :people }
      it { expect(subject.people.length).to eq 2 }
      it { expect(subject.people.first).to be_a Contacts::Person }
    end
  end


  context 'attributes' do
    let(:siret) { "123445" }
    let(:tva) { "my-custom-tva" }
    let(:employees_count) { 66 }

    subject { build :contact_company, siret: siret, tva: tva, employees_count: employees_count }

    describe '.siret' do
      it { should respond_to(:siret) }
      it { expect(subject.siret).to be_a String }
      it { expect(subject.siret).to eq siret }
    end

    describe '.tva' do
      it { should respond_to(:tva) }
      it { expect(subject.tva).to be_a String }
      it { expect(subject.tva).to eq tva }
    end

    describe '.employees_count' do
      it { should respond_to(:employees_count) }
      it { expect(subject.employees_count).to eq employees_count }
    end
  end
end

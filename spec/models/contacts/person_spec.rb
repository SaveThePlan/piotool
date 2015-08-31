require 'rails_helper'

RSpec.describe Contacts::Person, type: :model do
  let(:first_name) { "Michel" }
  let(:mobile) { "06 22 33 44 55" }
  let(:job) { "Boss" }

  let(:b_contact) { build :contact_person }
  let(:b_known_contact) { build :contact_person, mobile: mobile, job: job, first_name: first_name }
  let(:b_in_company) { build :contact_person_in_company }

  context 'inheritance' do
    describe 'subclass Contact' do
      it { expect(subject).to be_a Contact }
    end

    describe 'keeps table_name' do
      it { expect(Contacts::Person.table_name).to eq Contact.table_name }
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
      it { expect(build :contact_person, name: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.comany (belongs_to Contacts::Company)' do
      subject { b_in_company }
      it { expect(subject).to respond_to :company }
      it { expect(subject.company).to be_a Contacts::Company }
    end
  end


  context 'attributes' do
    subject { b_known_contact }

    describe '.mobile' do
      it { should respond_to(:mobile) }
      it { expect(subject.mobile).to be_a String }
      it { expect(subject.mobile).to eq mobile }
    end

    describe '.first_name' do
      it { should respond_to(:first_name) }
      it { expect(subject.first_name).to be_a String }
      it { expect(subject.first_name).to eq first_name }
    end

    describe '.job' do
      it { should respond_to(:job) }
      it { expect(subject.job).to be_a String }
      it { expect(subject.job).to eq job }
    end
  end
end

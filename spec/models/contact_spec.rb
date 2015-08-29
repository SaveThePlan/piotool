require 'rails_helper'

RSpec.describe Contact, type: :model do

  let(:name) { "John Doe" }
  let(:email) { "john@example.com" }
  let(:address) { "A la croisee des chemins" }
  let(:phone) { "01 22 33 44 55" }
  let(:fax) { "01 22 33 44 00" }
  let(:website) { "http://website.com" }

  let(:b_contact) { build :contact }
  let(:b_known_contact) { build :contact, name: name, email: email, address: address, phone: phone, website: website, fax: fax }


  context 'validations' do
    describe 'presence of name' do
      it { expect(b_contact).to be_valid }
      it { expect(build :contact, name: nil).to_not be_valid }
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
  end

end

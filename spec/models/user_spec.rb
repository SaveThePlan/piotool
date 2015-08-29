require 'rails_helper'

RSpec.describe User, type: :model do

  let(:email) { 'myemail@example.com' }
  let(:b_user) { build :user }
  let(:b_known_user) { build :user, email: email }


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


  context 'attributes' do
    subject { b_known_user }

    describe '.email' do
      it { should respond_to(:email) }
      it { expect(subject.email).to be_a String }
      it { expect(subject.email).to eq email }
    end
  end

end

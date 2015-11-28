require 'rails_helper'

RSpec.describe Favorite, type: :model do

  let(:b_favorite) { build :favorite }


  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of title' do
      it { expect(b_favorite).to be_valid }
      it { expect(build :favorite, title: nil).to_not be_valid }
    end

    describe 'presence of url' do
      it { expect(b_favorite).to be_valid }
      it { expect(build :favorite, url: nil).to_not be_valid }
    end

    describe 'presence of user' do
      it { expect(b_favorite).to be_valid }
      it { expect(build :favorite, user: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.user (belongs_to)' do
      subject { b_favorite }
      it { expect(subject).to respond_to :user }
      it { expect(subject.user).to be_a User }
    end
  end


  context 'scopes' do
  end


  context 'attributes' do
    let(:title) { "Hello I am the title" }
    let(:content) { "Hello I am the content" }
    let(:url) { "http://example.com" }

    subject { build :favorite, title: title, content: content, url: url }

    describe '.title' do
      it { should respond_to(:title) }
      it { expect(subject.title).to be_a String }
      it { expect(subject.title).to eq title }
    end

    describe '.content' do
      it { should respond_to(:content) }
      it { expect(subject.content).to be_a String }
      it { expect(subject.content).to eq content }
    end

    describe '.url' do
      it { should respond_to(:url) }
      it { expect(subject.url).to be_a String }
      it { expect(subject.url).to eq url }
    end
  end

end

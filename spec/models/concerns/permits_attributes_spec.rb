require 'rails_helper'

class MinimalTestModel
  include PermitsAttributes

  def self.attribute_names; end
end




RSpec.describe PermitsAttributes, :type => :model do

  let(:attr_array) { %w(attr1 attr2 attr3 model_id) }
  let(:attr_sym_array) { attr_array.map {|a| a.to_sym} }
  let(:valid_hash) { {attr1:'attr1', attr3:'attr3', attr2:'attr2', model_id:'2'} }
  let(:invalid_hash) { {attr4:'attr4', attr5:'attr5'} }
  let(:full_hash) { valid_hash.merge invalid_hash }
  let(:valid_params) { ActionController::Parameters.new attr1:'attr1', attr3:'attr3', attr2:'attr2', model_id:'2' }
  let(:invalid_params) { ActionController::Parameters.new attr4:'attr4', attr5:'attr5' }
  let(:full_params) { valid_params.merge invalid_params }

  before(:each) do
    allow_message_expectations_on_nil
    allow(nil).to receive(:pluralize_table_names).and_return(nil)
    allow(MinimalTestModel).to receive(:attribute_names).and_return(attr_array)
  end


  describe '.attributes_list' do
    it 'responds to attributes_list' do
      expect(MinimalTestModel).to respond_to :attributes_list
    end

    it 'returns an array of sym corresponding to attributes' do
      expect(MinimalTestModel.attributes_list).to eq attr_sym_array
    end
  end


  describe '.permits_params' do
    context 'with ActionController::Parameters' do
      subject { MinimalTestModel.permits_params(full_params) }
      it 'return valid params' do
        expect(subject).to eq valid_params
      end

      it 'permits attributes' do
        expect(subject).to be_permitted
      end
    end

    context 'with simple Hash' do
      it 'return valid params' do
        expect(MinimalTestModel.permits_params(full_hash)).to eq valid_hash
      end
    end
  end

end

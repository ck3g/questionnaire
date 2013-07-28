require 'spec_helper'

describe Questionnaire do
  it 'has a valid factory' do
    expect(create :questionnaire).to be_valid
  end

  describe '.validations' do
    context 'when valid' do
      subject { create :questionnaire }
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
    end
  end

  describe '.published' do
    let!(:published) { create :questionnaire }
    let!(:unpublished) { create :unpublished_questionnaire }

    it 'selects only publushed questionnaires' do
      expect(Questionnaire.published).to eq [published]
    end
  end
end

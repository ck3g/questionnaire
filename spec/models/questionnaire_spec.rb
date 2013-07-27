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
end

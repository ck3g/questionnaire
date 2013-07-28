require 'spec_helper'

describe Answer do
  it 'has a valid factory' do
    expect(create :answer).to be_valid
  end

  describe '.associations' do
    it { should belong_to :question }
  end

  describe '.validations' do
    context 'when valid' do
      subject { create :answer }
      it { should validate_presence_of :content }
      it { should validate_uniqueness_of(:content).scoped_to(:question_id) }
      it { should validate_presence_of :points }
      it { should validate_numericality_of(:points).only_integer }
    end
  end
end

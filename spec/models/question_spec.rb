require 'spec_helper'

describe Question do
  it 'has a valid factory' do
    expect(create :question).to be_valid
  end

  describe '.associations' do
    it { should belong_to :questionnaire }
    it { should have_many(:answers).dependent(:destroy) }
  end

  describe '.validations' do
    context 'when valid' do
      subject { create :question }
      it { should validate_presence_of :title }
      it { should validate_uniqueness_of(:title).scoped_to(:questionnaire_id) }
    end
  end
end

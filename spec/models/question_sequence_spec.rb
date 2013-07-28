require 'spec_helper'

describe QuestionSequence do
  describe '.associations' do
    it { should belong_to :parent }
    it { should belong_to :child }
  end
end

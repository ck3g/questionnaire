require 'spec_helper'
require 'cancan/matchers'

shared_examples 'guest' do
  let!(:unpublished) { create :unpublished_questionnaire }
  it { should_not be_able_to :manage, Questionnaire }
  it { should_not be_able_to :read, unpublished }
end

describe Ability do
  context 'when user is admin' do
    subject { Ability.new create(:admin) }
    it { should be_able_to :manage, Questionnaire }
  end

  context 'when user is guest' do
    subject { Ability.new nil }
    it_behaves_like 'guest'
  end

  context 'when registered user' do
    subject { Ability.new create(:user) }
    it_behaves_like 'guest'
  end
end

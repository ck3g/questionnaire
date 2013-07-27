require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  describe '#admin?' do
    context 'when user is admin' do
      subject { create :admin }
      it { should be_admin }
    end

    context 'when user isnt admin' do
      subject { create :user }
      it { should_not be_admin }
    end
  end
end

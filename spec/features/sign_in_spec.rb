require 'spec_helper'

feature 'Sign in' do
  given!(:user) { create :user, email: 'bruce@wayne.com' }

  scenario 'user can sign in using valid credentials' do
    sign_in_as 'bruce@wayne.com', 'secret'

    expect(current_path).to eq '/'
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end
end

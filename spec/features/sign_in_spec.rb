require 'spec_helper'

feature 'Sign in' do
  given!(:user) { create :user, email: 'bruce@wayne.com' }

  scenario 'user can sign in using valid credentials' do
    visit '/users/sign_in'

    within '#new_user' do
      fill_in 'user_email', with: 'bruce@wayne.com'
      fill_in 'user_password', with: 'secret'
      click_button I18n.t('helpers.auth.sign_in')
    end

    expect(current_path).to eq '/'
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end
end

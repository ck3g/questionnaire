require 'spec_helper'

feature 'Sign Up' do
  scenario 'can sign up using valid credentials' do
    visit '/users/sign_up'

    within '#new_user' do
      fill_in 'user_email', with: 'bruce@wayne.com'
      fill_in 'user_password', with: 'secret'
      fill_in 'user_password_confirmation', with: 'secret'
      click_button I18n.t('helpers.auth.sign_up')
    end

    expect(User.count).to eq 1
    expect(current_path).to eq '/'
    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end
end

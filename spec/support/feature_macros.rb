module FeatureMacros
  def sign_in_as(email, password)
    visit '/users/sign_in'

    within '#new_user' do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button I18n.t('helpers.auth.sign_in')
    end
  end
end

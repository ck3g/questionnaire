require 'spec_helper'

feature 'Manage questionnaires', %q{
  I am signed as admin
  And I want to create questionnaire
} do
  given!(:admin) { create :admin, email: 'admin@example.com' }
  given!(:questionnaire) { create :questionnaire, name: 'I am a new questionnaire' }

  scenario 'can create questionnaire' do
    sign_in_as 'admin@example.com', 'secret'
    visit '/questionnaires/new'

    within '#new_questionnaire' do
      fill_in 'questionnaire_name', with: 'Who is the best?'
      click_button I18n.t('helpers.submit.questionnaire.create')
    end

    expect(current_path).to eq questionnaire_path(Questionnaire.last)
    expect(page).to have_content I18n.t(:has_been_created)
  end

  scenario 'guest cannot create questionnaire' do
    visit '/questionnaires/new'

    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('unauthorized.manage.all')
  end

  scenario 'admin can edit questionnaire' do
    sign_in_as 'admin@example.com', 'secret'
    visit edit_questionnaire_path(questionnaire)

    fill_in 'questionnaire_name', with: 'I am an edited questionnaire'
    click_button I18n.t('helpers.submit.questionnaire.update')

    expect(current_path).to eq questionnaire_path(questionnaire)
    expect(page).to have_content I18n.t(:has_been_updated)
    within 'h2' do
      expect(page).to have_content 'I am an edited questionnaire'
    end
  end

  scenario 'raises error than questionnaire name is blank' do
    sign_in_as 'admin@example.com', 'secret'
    visit edit_questionnaire_path(questionnaire)

    fill_in 'questionnaire_name', with: ''
    click_button I18n.t('helpers.submit.questionnaire.update')

    expect(page).to have_content I18n.t('activerecord.errors.messages.blank')
  end
end

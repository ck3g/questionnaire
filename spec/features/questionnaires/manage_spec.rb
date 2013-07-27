require 'spec_helper'

feature 'Manage questionnaires', %q{
  I am signed as admin
  And I want to create questionnaire
} do
  given!(:admin) { create :admin, email: 'admin@example.com' }

  scenario 'can create questionnaire' do
    visit '/questionnaires/new'

    within '#new_questionnaire' do
      fill_in 'questionnaire_name', with: 'Who is the best?'
      click_button I18n.t('helpers.submit.questionnaire.create')
    end

    expect(current_path).to eq questionnaire_path(Questionnaire.last)
    expect(page).to have_content I18n.t(:has_been_created)
  end
end

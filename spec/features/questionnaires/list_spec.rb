require 'spec_helper'

feature 'List of Questionnaires' do
  given!(:admin) { create :admin, email: 'admin@example.com' }
  given!(:published) { create :questionnaire, name: 'Who is the best?' }
  given!(:unpublished) { create :unpublished_questionnaire, name: 'Am I unpublished?' }

  scenario 'Anyone can view list of published questionnaires' do
    visit '/questionnaires'

    within 'h2' do
      expect(page).to have_content I18n.t('questionnaires.title')
    end

    within '#questionnaires' do
      expect(page).to have_content 'Who is the best?'
      expect(page).to_not have_content 'Am I unpublished'
    end
  end

  scenario 'Admin can view unpublished questionnaires' do
    sign_in_as 'admin@example.com', 'secret'
    visit '/questionnaires'

    within '#questionnaires' do
      expect(page).to have_content 'Am I unpublished'
    end
  end
end

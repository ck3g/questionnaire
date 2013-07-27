require 'spec_helper'

feature 'List of Questionnaires' do
  given!(:questionnaire) { create :questionnaire, name: 'Who is the best?' }

  scenario 'Anyone can view list of available questionnaires' do
    visit '/questionnaires'

    within 'h2' do
      expect(page).to have_content I18n.t('questionnaires.title')
    end

    within '#questionnaires' do
      expect(page).to have_content 'Who is the best?'
    end
  end
end

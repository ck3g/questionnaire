require 'spec_helper'

feature 'Manage questions', %q{
  I am signed in as admin
  And I visit edit questionnaire page
  And I want to manage questions
} do
  given!(:admin) { create :admin, email: 'admin@example.com' }
  given!(:questionnaire) { create :questionnaire }

  scenario 'can add more questions to questionnaire' do
    sign_in_as 'admin@example.com', 'secret'
    visit edit_questionnaire_path(questionnaire)

    within '#new_question' do
      fill_in 'question_title', with: 'Question title'
      fill_in 'question_description', with: 'Question description'
      fill_in 'question_answer_content_0', with: 'Wrong answer 1'
      fill_in 'question_answer_content_1', with: 'Right answer'
      check 'question_answer_correct_1'
      fill_in 'question_answer_content_2', with: 'Wrong answer 2'
      click_button I18n.t('helpers.submit.question.create')
    end

    within '#questions' do
      expect(page).to have_content 'Question title'
    end

    within "#question_#{ Question.last.id }" do
      expect(page).to have_content 'Wrong answer 1'
      expect(page).to have_content 'Right answer'
      expect(page).to have_content 'Wrong answer 2'
    end
  end
end

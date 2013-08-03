require 'spec_helper'

feature 'Manage questions', %q{
  I am signed in as admin
  And I visit edit questionnaire page
  And I want to manage questions
} do
  given!(:admin) { create :admin, email: 'admin@example.com' }
  given!(:questionnaire) { create :questionnaire }
  given!(:question1) { create :question, questionnaire: questionnaire }
  given!(:question2) { create :question, questionnaire: questionnaire }
  given!(:question3) { create :question, questionnaire: questionnaire }

  scenario 'can add more questions to questionnaire' do
    sign_in_as 'admin@example.com', 'secret'
    visit edit_questionnaire_path(questionnaire)

    within '#new_question' do
      fill_in 'question_title', with: 'Question title'
      fill_in 'question_description', with: 'Question description'
      fill_in 'question_answer_content_0', with: 'Answer 1'
      fill_in 'question_answer_content_1', with: 'Answer 2'
      click_button I18n.t('helpers.submit.question.create')
    end

    within '#questions' do
      expect(page).to have_content 'Question title'
    end

    within "#question_#{ Question.last.id }" do
      expect(page).to have_content 'Answer 1'
      expect(page).to have_content 'Answer 2'
    end
  end

  scenario 'can choose parent questions' do
    sign_in_as 'admin@example.com', 'secret'
    visit edit_questionnaire_path(questionnaire)

    within '#new_question' do
      fill_in 'question_title', with: 'Question title'
      fill_in 'question_answer_content_0', with: 'Answer 1'
      fill_in 'question_answer_content_1', with: 'Answer 2'
      select question1.title, from: 'question_possible_parents'
      select question2.title, from: 'question_possible_parents'
      click_button I18n.t('helpers.submit.question.create')
    end

    within "#question_#{ Question.last.id } .parents" do
      expect(page).to have_content question1.title
      expect(page).to have_content question2.title
      expect(page).to_not have_content question3.title
    end
  end

  scenario 'receives an error when question fields is empty' do
    sign_in_as 'admin@example.com', 'secret'
    visit edit_questionnaire_path(questionnaire)

    within '#new_question' do
      click_button I18n.t('helpers.submit.question.create')
    end

    within '#new_question' do
      expect(page).to have_content I18n.t('activerecord.errors.messages.blank')
      expect(page).to have_content I18n.t(
        'activerecord.errors.answers.should_have_at_least', count: 2)
    end
  end
end

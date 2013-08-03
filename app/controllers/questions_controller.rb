class QuestionsController < ApplicationController
  authorize_resource

  before_action :find_questionnaire

  def create
    @question_form = QuestionForm.new @questionnaire, params[:question]
    if @question_form.save
      redirect_to edit_questionnaire_path(@questionnaire), notice: t(:has_been_created)
    else
      @question = @question_form.question
      render 'questionnaires/edit'
    end
  end

  private
  def find_questionnaire
    @questionnaire = Questionnaire.find params[:questionnaire_id]
  end
end

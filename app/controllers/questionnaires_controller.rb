class QuestionnairesController < ApplicationController
  before_action :find_questionnaire, only: [:show, :edit, :update, :destroy]

  def index
    @questionnaires = Questionnaire.all
  end

  def show

  end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new questionnaire_params
    if @questionnaire.save
      redirect_to @questionnaire, notice: t(:has_been_created)
    else
      render :new
    end
  end

  private
  def find_questionnaire
    @questionnaire = Questionnaire.find params[:id]
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:name)
  end
end
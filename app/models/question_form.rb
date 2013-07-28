class QuestionForm
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :questionnaire, :params, :question

  validates :title, presence: true

  delegate :title, :description, to: :question, prefix: false, allow_nil: true

  def initialize(questionnaire, params)
    @questionnaire = questionnaire
    @params = params

    @question = @questionnaire.questions.new
    @question.title = params[:title]
    @question.description = params[:description]
  end

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
  def persist!
    params[:answers].each do |answer|
      @question.answers.new(content: answer[:content],
                            correct: answer[:correct] == '1')

    @question.save!
    end
  end
end

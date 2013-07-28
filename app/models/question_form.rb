class QuestionForm
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  REQUIRED_ANSWERS = 2

  attr_reader :questionnaire, :params, :question

  validates :title, presence: true
  validate :should_have_at_least_2_answers

  delegate :title, :description, to: :question, prefix: false, allow_nil: true

  def initialize(questionnaire, params)
    @questionnaire = questionnaire
    @params = params

    @question = @questionnaire.questions.new
    @question.title = params[:title]
    @question.description = params[:description]

    params[:answers].each do |answer|
      if answer[:content].present?
        @question.answers.new(content: answer[:content])
      end
    end
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
    @question.save!
    params[:possible_parents].select(&:present?).each do |parent_id|
      QuestionSequence.create! parent_id: parent_id, child_id: @question.id
    end
  end

  def should_have_at_least_2_answers
    if @question.answers.size < REQUIRED_ANSWERS
      errors.add(
        :answers,
        I18n.t('activerecord.errors.answers.should_have_at_least',
               count: REQUIRED_ANSWERS)
      )
    end
  end
end

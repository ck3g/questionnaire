module QuestionsHelper
  def collection_of_parents(questionnaire)
    questionnaire.questions.map { |q| [q.title, q.id] }
  end

  def answer_label_pattern
    t('questions.answer_number', number: 1)[0...-1]
  end
end

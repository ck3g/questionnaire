module QuestionsHelper
  def collection_of_parents(questionnaire)
    questionnaire.questions.map { |q| [q.title, q.id] }
  end
end

class Questionnaire < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :questions, dependent: :destroy

  scope :published, -> { where.not(published_at: nil) }

  def question_list
    questions.includes(:answers, :parents)
  end
end

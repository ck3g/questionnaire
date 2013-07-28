class Answer < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true, uniqueness: { scope: :question_id }
  validates :points, presence: true, numericality: { only_integer: true }
end

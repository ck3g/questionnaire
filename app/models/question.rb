class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  has_many :parent_sequences, class_name: 'QuestionSequence',
    foreign_key: 'parent_id', dependent: :destroy
  has_many :child_sequences, class_name: 'QuestionSequence',
    foreign_key: 'child_id', dependent: :destroy
  has_many :parents, class_name: 'Question', through: :child_sequences
  has_many :children, class_name: 'Question', through: :parent_sequences

  attr_accessor :possible_parents

  validates :title, presence: true, uniqueness: { scope: :questionnaire_id }
end

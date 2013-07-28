class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :questionnaire_id }
end

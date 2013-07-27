class Questionnaire < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
end

class Questionnaire < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  scope :published, -> { where.not(published_at: nil) }
end

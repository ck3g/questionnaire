class QuestionSequence < ActiveRecord::Base
  belongs_to :parent, class_name: 'Question', foreign_key: 'parent_id'
  belongs_to :child, class_name: 'Question', foreign_key: 'child_id'
end

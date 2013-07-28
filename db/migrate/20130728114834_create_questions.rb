class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.references :questionnaire, index: true

      t.timestamps
    end
  end
end

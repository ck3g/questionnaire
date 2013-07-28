class CreateQuestionSequences < ActiveRecord::Migration
  def change
    create_table :question_sequences do |t|
      t.integer :parent_id, null: false
      t.integer :child_id, null: false

      t.timestamps
    end
    add_index :question_sequences, [:parent_id, :child_id], unique: true
  end
end

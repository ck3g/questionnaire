class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.boolean :correct, default: false
      t.references :question, index: true
      t.integer :points, null: false, default: 0

      t.timestamps
    end
    add_index :answers, :correct
  end
end

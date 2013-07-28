class RemoveCorrectFromAnswers < ActiveRecord::Migration
  def up
    remove_index :answers, :correct
    remove_column :answers, :correct
  end

  def down
    add_column :answers, :correct, :boolean, null: false
    add_index :answers, :correct
  end
end

class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :name, null: false
      t.datetime :published_at

      t.timestamps
    end
    add_index :questionnaires, :published_at
  end
end

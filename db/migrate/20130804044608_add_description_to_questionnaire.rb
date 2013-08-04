class AddDescriptionToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :description, :text
  end
end

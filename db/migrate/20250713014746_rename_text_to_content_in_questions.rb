class RenameTextToContentInQuestions < ActiveRecord::Migration[8.0]
  def change
    rename_column :questions, :text, :content
  end
end

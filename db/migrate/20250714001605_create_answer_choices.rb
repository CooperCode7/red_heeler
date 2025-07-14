class CreateAnswerChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :answer_choices do |t|
      t.references :question, null: false, foreign_key: true
      t.string :option
      t.integer :position

      t.timestamps
    end
  end
end

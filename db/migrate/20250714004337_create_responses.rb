class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end

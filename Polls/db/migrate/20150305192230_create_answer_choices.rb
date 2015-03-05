class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.text :text

      t.timestamps
    end

    add_index(:answer_choices, :question_id)

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end

    add_index(:responses, :user_id)
    add_index(:responses, :answer_id)
  end
end

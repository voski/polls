class UpdateAnserChoices < ActiveRecord::Migration
  def change
    change_column_null :answer_choices, :text, false
  end
end

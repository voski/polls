class RemoveUserIndex < ActiveRecord::Migration
  def change
    remove_index(:users, column: :user_name)
  end
end

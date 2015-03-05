class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true

      t.timestamps
    end

    add_index(:users, :user_name)

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :polls, :author_id
    add_index :polls, :title

    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.text :text, null: false

      t.timestamps
    end

    add_index(:questions, :poll_id)
  end
end

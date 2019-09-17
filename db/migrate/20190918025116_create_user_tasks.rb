class CreateUserTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tasks do |t|
      t.datetime :time_start
      t.datetime :time_end
      t.integer :status , default: 1
      t.references :user , foreign_key: true
      t.timestamps
    end
    add_index :user_tasks, [:user_id , :created_at]

  end
end

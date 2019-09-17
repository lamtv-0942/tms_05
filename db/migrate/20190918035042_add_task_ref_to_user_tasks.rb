class AddTaskRefToUserTasks < ActiveRecord::Migration[5.2]
  def change
    change_table(:user_tasks) do |t|
      t.references :task, foreign_key: true
    end
    add_index :user_tasks, [:task_id , :created_at]
  end
end

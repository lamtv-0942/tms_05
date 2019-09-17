class AddSubjectRefToTasks < ActiveRecord::Migration[5.2]
  def change
    change_table(:tasks) do |t|
      t.references :subject, foreign_key: true
    end
  add_index :tasks, [:subject_id, :created_at]
  end
end

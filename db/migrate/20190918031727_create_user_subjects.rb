class CreateUserSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_subjects do |t|
      t.datetime :time_join
      t.datetime :time_leave
      t.integer :status , default: 1
      t.references :user , foreign_key: true
      t.references :subject , foreign_key: true
      t.timestamps
    end
    add_index :user_subjects, [:user_id , :created_at]
    add_index :user_subjects, [:subject_id , :created_at]
  end
end

class CreateCourseManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :course_managements do |t|
      t.datetime :time_join
      t.datetime :time_leave
      t.integer :status , default: 2
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :course_managements, [:course_id, :created_at]
    add_index :course_managements, [:user_id, :created_at]
  end
end

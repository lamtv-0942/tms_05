class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.timestamps
      t.references :course, foreign_key: true
      t.references :subject, foreign_key: true
    end
    add_index :course_subjects, [:course_id, :created_at]
    add_index :course_subjects, [:subject_id, :created_at]

  end
end

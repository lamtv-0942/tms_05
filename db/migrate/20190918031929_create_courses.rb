class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :thumbnail
      t.datetime :time_start
      t.datetime :time_end
      t.integer :status , default: 1
      t.timestamps
    end
  end
end

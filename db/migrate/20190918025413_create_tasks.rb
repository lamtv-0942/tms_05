class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :label
      t.datetime :time_start
      t.datetime :time_end
      t.integer :status , default: 1
      t.integer :creator_id
      t.integer :day_learn
      t.timestamps
    end
  end
end

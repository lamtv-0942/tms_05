class CreateLogActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :log_activities do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :log_activities, [:user_id, :created_at]
  end
end

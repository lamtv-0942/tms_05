class Task < ApplicationRecord
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :subject

  belongs_to :user, foreign_key: :creator_id
end

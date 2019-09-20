class Subject < ApplicationRecord
  has_many :tasks
  has_many :user_subjects
  has_many :users, through: :user_subjects

  has_many :course_subjects
  has_many :courses, through: :course_subjects

  validates :name, presence: true,
    length: {maximum: Settings.name_length_maximum,
    minimum: Settings.name_length_minimum}
  validates :description, presence: true,
    length: {maximum: Settings.content_text_max_length}
  mount_uploader :thumbnail, ThumbnaiUploader

  scope :sort_subject, ->{order id: :desc}
end

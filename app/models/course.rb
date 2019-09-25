class Course < ApplicationRecord
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  has_many :course_managements
  has_many :users, through: :course_managements

  belongs_to :user, foreign_key: :creator_id

  enum status: {is_open: 1, is_close: 2}
  validates :name, presence: true,
    length: {maximum: Settings.maximum_length_description_course}
  validates :description, presence: true,
    length: {maximum: Settings.maximum_length_name_course}
  mount_uploader :thumbnail, PictureUploader
end

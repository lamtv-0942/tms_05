class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  scope :sort_by_order, ->{order time_join: :asc}
end

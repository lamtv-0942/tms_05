class User < ApplicationRecord
  enum role: {admin: 1, trainer: 2, traine: 3}

  has_many :log_activities, dependent: :destroy

  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  has_many :course_managements
  has_many :courses, through: :course_managements

  has_many :courses, foreign_key: :creator_id

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessor :remember_token
  before_save :downcase_email
  validates :full_name, presence: true,
            length: {maximum: Settings.maximum_length_name}
  validates :email, presence: true,
            length: {maximum: Settings.maximum_length_email},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: Settings.minimum_length_password},
            allow_nil: true

  scope :sort_by_created_at, ->{order created_at: :desc}

  class << self
    def digest string
      if cost = ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false unless digest
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  private

  def downcase_email
    email.downcase!
  end
end

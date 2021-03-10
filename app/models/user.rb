# Schema.rb
# t.string "email", default: "", null: false
# t.boolean "is_validated", default: false, null: false
# t.string "role", default: "student", null: false
# t.string "first_name", null: false
# t.string "last_name", null: false

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # has_many :session_attendees, class_name: 'student', foreign_key: 'student_id', dependent: :nullify
  # has_many :sessions, through: :session_attendees, foreign_key: 'student_id', dependent: :nullify
  # has_many :courses, class_name: 'teacher', foreign_key: 'teacher_id', dependent: :nullify
  has_many :session_attendees
  has_many :course_sessions, through: :session_attendees

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "L'adresse email n'est pas correcte." }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  scope :students, -> { where(role: 'student') }
  scope :admins, -> { where(role: 'admin') }
  scope :teachers, -> { where(role: 'teacher') }
  scope :to_validate, -> { where(is_validated: false) }
end

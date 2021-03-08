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

  has_many :session_attendees, class_name: 'student', foreign_key: 'student_id', dependent: :nullify
  has_many :sessions, through: :session_attendees, foreign_key: 'student_id'
  has_many :courses, class_name: 'teacher', foreign_key: 'teacher_id', dependent: :nullify

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "L'adresse email n'est pas correcte." }

  validates :is_validated, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  def self.students
    User.all.select { |user| user.role == 'student' }
  end

  def self.teachers
    User.all.select { |user| user.role == 'teacher' }
  end

  def self.admins
    User.all.select { |user| user.role == 'admin' }
  end
end

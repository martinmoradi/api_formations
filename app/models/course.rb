#  t.string 'title', null: false
#  t.bigint 'teacher_id', null: false
class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  has_many :course_sessions
  has_many :session_attendees, through: :course_sessions
  has_many :course_category_assignments
  has_many :categories, through: :course_category_assignments

  validates :title, presence: true
end

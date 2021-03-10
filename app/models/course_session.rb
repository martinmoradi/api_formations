#   t.date "date", null: false
#   t.bigint "classroom_id", null: false
#   t.bigint "course_id", null: false
class CourseSession < ApplicationRecord
  belongs_to :course
  belongs_to :classroom
  has_many :session_attendees
  has_many :students, through: :session_attendees

  validates :date, presence: true
end

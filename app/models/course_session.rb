#   t.date "date", null: false
#   t.bigint "classroom_id", null: false
#   t.bigint "course_id", null: false
class CourseSession < ApplicationRecord
  belongs_to :course, dependent: :nullify
  belongs_to :classroom, dependent: :nullify
  has_many :session_attendees, dependent: :nullify
  has_many :students, through: :session_attendees

  validates :date, presence: true
end

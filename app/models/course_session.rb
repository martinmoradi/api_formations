#   t.date "date", null: false
#   t.bigint "classroom_id", null: false
#   t.bigint "course_id", null: false
class CourseSession < ApplicationRecord
  belongs_to :course, dependent: :destroy
  belongs_to :classroom, dependent: :destroy
  has_many :session_attendees, dependent: :nullify
  has_many :students, through: :session_attendees, dependent: :nullify

  validates :date, presence: true
end

#   t.float "assessment"
#   t.bigint "student_id", null: false
#   t.bigint "session_id", null: false
class SessionAttendee < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :course_session

  validates :assessment, numericality: true, on: :update
  validates :student_id, :course_session_id, presence: true
end

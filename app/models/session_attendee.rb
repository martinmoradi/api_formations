#   t.float "assessment"
#   t.bigint "student_id", null: false
#   t.bigint "session_id", null: false
class SessionAttendee < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :session

  validates :assessment, numericality: true
  validates :student_id, :session_id, presence: true
end

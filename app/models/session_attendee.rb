#   t.float "assessment"
#   t.bigint "student_id", null: false
#   t.bigint "session_id", null: false
class SessionAttendee < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :course_session

  before_create :remaining_seats?, :already_registered?
  after_create :register_to_session
  validates :assessment, numericality: true, on: :update

  def already_registered?
    SessionAttendee.where(student_id: User.find(student_id)).each do |session_attendee|
      throw :abort if session_attendee.course_session.date == course_session.date
    end
  end

  def remaining_seats?
    @session = CourseSession.find(course_session.id)
    throw :abort if @session.remaining_seats < 1
  end

  def register_to_session
    @session = CourseSession.find(course_session.id)
    @session.update(remaining_seats: @session.remaining_seats -= 1)
  end
end

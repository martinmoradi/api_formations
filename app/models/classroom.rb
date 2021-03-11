#  t.string :room_location
class Classroom < ApplicationRecord
  has_many :course_sessions, dependent: :nullify

  validates :room_location, presence: true
end

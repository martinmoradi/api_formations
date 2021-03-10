#  t.string :room_location
class Classroom < ApplicationRecord
  has_many :course_sessions

  validates :room_location, presence: true
end

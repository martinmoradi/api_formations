#   t.date "date", null: false
#   t.bigint "classroom_id", null: false
#   t.bigint "course_id", null: false
class Session < ApplicationRecord
  belongs_to :course
  has_many :classrooms

  validates :date, :classroom_id, :course_id, presence: true
end

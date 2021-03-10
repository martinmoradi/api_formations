#  t.bigint "course_id", null: false
#  t.bigint "category_id", null: false
class CourseCategoryAssignment < ApplicationRecord
  belongs_to :course
  belongs_to :category
end

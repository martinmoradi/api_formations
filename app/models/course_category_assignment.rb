#  t.bigint "course_id", null: false
#  t.bigint "category_id", null: false
class CourseCategoryAssignment < ApplicationRecord
  belongs_to :course, dependent: :destroy
  belongs_to :category, dependent: :destroy
end

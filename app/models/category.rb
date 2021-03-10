# t.string "title", null: false
class Category < ApplicationRecord
  has_many :course_category_assignments
  has_many :courses, through: :course_category_assignments
  validates :title, presence: true
end

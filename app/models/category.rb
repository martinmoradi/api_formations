# t.string "title", null: false
class Category < ApplicationRecord
  has_many :course_category_assignments, dependent: :nullify
  has_many :courses, through: :course_category_assignments, dependent: :nullify
  validates :title, presence: true
end

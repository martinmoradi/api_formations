  # t.string "title", null: false
class Category < ApplicationRecord
  has_many :course_category_assignment
  
  validates :title, presence: true
end

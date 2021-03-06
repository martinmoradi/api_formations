class CreateCourseCategoryAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :course_category_assignments do |t|
      t.references :course, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

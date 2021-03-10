class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :course_sessions do |t|
      t.date :date, null: false
      t.references :classroom, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

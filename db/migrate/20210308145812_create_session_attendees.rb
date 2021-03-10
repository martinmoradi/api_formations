class CreateSessionAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :session_attendees do |t|
      t.float :assessment
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :course_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end

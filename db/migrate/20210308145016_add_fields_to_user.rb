class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_validated, :boolean, default: false, null: false
    add_column :users, :role, :string, default: 'student', null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
  end
end
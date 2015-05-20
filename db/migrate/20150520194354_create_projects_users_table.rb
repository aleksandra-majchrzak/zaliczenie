class CreateProjectsUsersTable < ActiveRecord::Migration
  def change
    create_table :projects_users, id: false do |t|
      t.integer :member_project_id
      t.integer :member_id

    end
    add_index :projects_users, :member_project_id
    add_index :projects_users, :member_id
  end
end

class AlterOwnerIdInProjects < ActiveRecord::Migration
  def change
    remove_reference :projects, :users_id
    add_reference :projects, :user, index: true, foreign_key: true
  end
end

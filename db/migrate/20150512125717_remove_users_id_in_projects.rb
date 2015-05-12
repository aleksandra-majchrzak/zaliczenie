class RemoveUsersIdInProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :users_id
  end
end

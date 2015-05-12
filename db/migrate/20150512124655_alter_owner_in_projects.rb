class AlterOwnerInProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :owner_email
    add_reference :projects, :users, index: true, foreign_key: true
  end
end

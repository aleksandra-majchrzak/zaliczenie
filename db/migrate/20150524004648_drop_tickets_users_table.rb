class DropTicketsUsersTable < ActiveRecord::Migration
  def change
    drop_table :tickets_users
  end
end

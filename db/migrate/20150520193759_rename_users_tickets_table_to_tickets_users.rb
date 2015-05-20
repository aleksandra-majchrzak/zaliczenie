class RenameUsersTicketsTableToTicketsUsers < ActiveRecord::Migration
  def self.up
    rename_table :users_tickets, :tickets_users
  end

 def self.down
   rename_table :tickets_users, :Users_tickets
 end
end

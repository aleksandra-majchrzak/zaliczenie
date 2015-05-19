class CreateUsersTicketsTable < ActiveRecord::Migration
  def change
    create_table :users_tickets, id: false do |t|
      t.integer :user_id
      t.integer :ticket_id
    end
    
    add_index :users_tickets, :user_id
    add_index :users_tickets, :ticket_id
  end
end

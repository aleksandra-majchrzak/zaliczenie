class AddFieldsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :priority, :int
    add_column :tickets, :difficulty, :int
    #add_column :tickets, :status, :status
  end
end

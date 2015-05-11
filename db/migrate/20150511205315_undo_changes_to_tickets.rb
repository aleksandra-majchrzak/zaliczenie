class UndoChangesToTickets < ActiveRecord::Migration
  def change
    drop_table :tickets
    
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.integer :difficulty
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :projects
  end
end

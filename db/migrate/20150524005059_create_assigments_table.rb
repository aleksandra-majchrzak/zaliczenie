class CreateAssigmentsTable < ActiveRecord::Migration
  def change
    create_table :assigments do |t|
      t.references :ticket, :index => true
      t.references :user, :index => true
      
      t.timestamps null: false
    end
    add_foreign_key :assigments, :tickets
    add_foreign_key :assigments, :users
  end
end

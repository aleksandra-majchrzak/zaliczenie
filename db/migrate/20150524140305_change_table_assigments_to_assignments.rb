class ChangeTableAssigmentsToAssignments < ActiveRecord::Migration
  def self.up
    rename_table :assigments, :assignments
  end

 def self.down
   rename_table :assignments, :assigments
 end
end

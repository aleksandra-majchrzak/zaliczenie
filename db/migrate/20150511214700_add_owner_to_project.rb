class AddOwnerToProject < ActiveRecord::Migration
  def change
    add_column :projects, :owner_email, :string
  end
end

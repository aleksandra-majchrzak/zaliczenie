class AddAttachmentInnerNameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :inner_attachment_name, :string
  end
end

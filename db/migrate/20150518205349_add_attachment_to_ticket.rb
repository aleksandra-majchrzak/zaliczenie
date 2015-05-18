class AddAttachmentToTicket < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :single_attachment
    end
  end

  def self.down
    remove_attachment :tickets, :single_attachment
  end
end

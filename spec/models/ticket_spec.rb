require 'rails_helper'

describe Ticket do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :priority }
  it { should have_attached_file(:single_attachment) }
  it { should validate_attachment_content_type(:single_attachment).
                allowing("image/jpg","image/jpeg", "image/png", "image/gif", "application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document")}
  it { should validate_attachment_size(:single_attachment).
                less_than(3.megabytes) }
  
  it { should belong_to :project }
  it { should have_many :assignments }
  it { should have_many :users }
  
end
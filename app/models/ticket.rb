class Ticket < ActiveRecord::Base
  belongs_to :project
  enum status: [ :active, :closed, :cancelled ]
  validates :name, presence: true
  validates :description, presence: true
  validates :priority, presence: true
  
  has_attached_file :single_attachment
  validates_attachment_content_type :single_attachment, :content_type => [
             "image/jpg", "image/png", "image/gif", "application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",]

end

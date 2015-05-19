class Ticket < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :users
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
  validates_attachment_file_name :single_attachment, :matches => [/gif\Z/, /png\Z/, /jpe?g\Z/, /docx?\Z/, /xls\Z/,/ppt\Z/]
  validates_with AttachmentSizeValidator, :attributes => :single_attachment, :less_than => 3.megabytes
  
  def attachment_type
    single_attachment_content_type
  end

end

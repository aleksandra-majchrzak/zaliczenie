class Ticket < ActiveRecord::Base
  belongs_to :project
  has_many :assigments
  has_many :users, through: :assigments
  attr_accessible :assignment, :assigment_attributes
  enum status: [ :active, :closed, :cancelled ]
  validates :name, presence: true
  validates :description, presence: true
  validates :priority, presence: true
  
  has_attached_file :single_attachment
  validates_attachment_content_type :single_attachment, :content_type => [
    "image/jpg","image/jpeg", "image/png", "image/gif", "application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",]
  validates_attachment_file_name :single_attachment, :matches => [/gif\Z/, /png\Z/, /jpe?g\Z/, /docx?\Z/, /xls\Z/,/ppt\Z/]
  validates_with AttachmentSizeValidator, :attributes => :single_attachment, :less_than => 3.megabytes
  
  attr_accessor :remove_single_attachment 

  before_save :delete_single_attachment, if: ->{remove_single_attachment == '1' && !single_attachment_updated_at_changed?} 

  def attachment_type
    single_attachment_content_type
  end
  
  private
  
  def delete_single_attachment
    self.single_attachment =nil 
    self.inner_attachment_name=nil
  end
end

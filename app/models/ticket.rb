class Ticket < ActiveRecord::Base
  belongs_to :project
  enum status: [ :active, :closed, :cancelled ]
  validates :name, presence: true
  validates :description, presence: true
  validates :priority, presence: true
end

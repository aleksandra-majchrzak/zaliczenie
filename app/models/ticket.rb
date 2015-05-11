class Ticket < ActiveRecord::Base
  belongs_to :project
  enum status: [ :active, :closed, :cancelled ]
end

class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :user
end

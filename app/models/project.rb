class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :owner, :class_name => "User", :foreign_key => 'user_id'
  validates :name, presence: true
end

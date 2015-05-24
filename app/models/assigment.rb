class Assigment < ActiveRecord::Base
  belongs_to :ticket, dependent: :destroy
  belongs_to :user, dependent: :destroy
end

class User < ActiveRecord::Base
  
  has_many :projects
  has_and_belongs_to_many :tickets
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  
  
  def  full_name
    "#{first_name} #{last_name}"
    #[first_name, last_name].join(" ")
  end
  
end

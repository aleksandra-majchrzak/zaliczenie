class User < ActiveRecord::Base
  
  has_many :projects
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  
  validates :first_name, presence: true
  validates :email, presence: true
  
  def  full_name
    "#{first_name} #{last_name}"
    #[first_name, last_name].join(" ")
  end
  
end

class User < ActiveRecord::Base
  
  has_many :owned_projects, :class_name => "Project", dependent: :destroy
  has_many :assignments
  has_many :tickets, through: :assignments
  has_and_belongs_to_many :member_projects, :class_name =>"Project", :foreign_key =>"member_id", :association_foreign_key => "member_project_id"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  
  
  def  full_name
    "#{first_name} #{last_name}"
    #[first_name, last_name].join(" ")
  end
  
end

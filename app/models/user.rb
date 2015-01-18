class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_and_belongs_to_many :invited_projects, class_name: "Project",dependent: :destroy
   has_many :owned_projects, class_name: "Project", dependent: :destroy

   validates :name, presence: true

end

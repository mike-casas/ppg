class Project < ActiveRecord::Base
  belongs_to :owner , class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :members ,class_name: "User"
  before_destroy { User.clear }
end

class Project < ActiveRecord::Base
  has_and_belong_to_many :users
end

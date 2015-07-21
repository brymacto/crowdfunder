class Project < ActiveRecord::Base
  has_many :pledges
  has_many :rewards
  has_many :backers, through: :pledges, class_name: 'User'
  belongs_to :owner, class_name: 'User'
end

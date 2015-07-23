class User < ActiveRecord::Base
  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :backed_projects, class_name: 'Project', through: :pledges, source: :project
  has_many :pledges

  authenticates_with_sorcery!

  validates :password, length: {minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end

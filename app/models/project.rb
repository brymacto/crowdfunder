class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  belongs_to :owner, class_name: User
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def amount_raised
    self.pledges.sum(:amount)
  end

  def days_until_project_deadline
    days_until_deadline = (self.end_date.to_date - Date.today.to_date).to_i
    if days_until_deadline >= 0
      days_until_deadline
    else
      0
    end
  end

end

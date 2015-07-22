class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  belongs_to :owner, class_name: User
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def amount_raised
    self.pledges.sum(:amount)
    # # rewards = self.rewards.pledges
    # # rewards.inject { |sum, x| sum + x }
    # total_amount = 0
    # pledges.each do |pledge|
    #   total_amount += pledge.amount
    # end
    # return total_amount
  end
end

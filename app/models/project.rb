class Project < ActiveRecord::Base
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def amount_raised
    # self.rewards.pledges.sum(:amount)
    # rewards = self.rewards.pledges
    # rewards.inject { |sum, x| sum + x }
    total_amount = 0
    self.rewards.each do |reward|
      total_amount += reward.pledges.sum(:amount)
    end
    return total_amount
  end
end

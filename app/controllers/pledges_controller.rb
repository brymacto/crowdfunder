class PledgesController < ApplicationController

  before_action :require_login

  def create
    @reward = Reward.find(params[:reward_id])
    @pledge = @reward.pledges.build
    @pledge.user = current_user
    @pledge.amount = @reward.amount

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to project_path(params[:project_id]), notice: "Pledge successfully created!" }
        format.js {}
      else
        format.html { redirect_to project_path(params[:project_id]), alert: "There was an error. Pledge not created." }
        format.js {}
      end
    end

  end

  def destroy

  end

end

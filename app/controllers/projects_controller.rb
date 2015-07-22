class ProjectsController < ApplicationController
  # before_filter :require_admin, only: [:create]
  # load_and_authorize_resource

  def index
    @projects = Project.order(end_date: :desc)
  end
  def show
    @project = Project.find(params[:id])
  end
  def edit
    @project = Project.find(params[:id])
  end
  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    @category = Category.find_or_create_by(name: params[:project][:category])
    @project.category_id = @category.id
    if @project.save
      redirect_to projects_path
    else
      render :new
    end

  end
  def new
    @project = Project.new

  end
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end

  end
  def destroy

  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :funding_goal, :owner_id, rewards_attributes: [:name, :description, :amount, :backer_limit, :_destroy])

  end
end

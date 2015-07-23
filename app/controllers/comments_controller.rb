class CommentsController < ApplicationController
  
  before_filter :load_project
  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user


    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_path(@project.id), notice: 'Comment added.'}
        format.js {}
      else
        format.html {render 'projects/show', alert: 'There was an error.' }
        format.js {}
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)

    if @comment.save
      redirect_to project_path(@project.id), notice: 'Comment saved'
    else
      render 'projects/show', alert: 'Comment not updated'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

end

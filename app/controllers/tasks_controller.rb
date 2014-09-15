class TasksController < ApplicationController

  before_action :set_task, only: [:show, :update, :destroy]

  before_action :render_main_layout_if_format_html

  respond_to :json, :html

  def index
    respond_with @tasks = Task.all.order('created_at')
  end

  def show
  end

  def create
    task_params
    respond_with Task.create({text: task_params[:text], done: false})
  end

  def update
    respond_with @task.update_attributes(task_params)
  end

  def destroy
    respond_with @task.destroy
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:text, :done)
  end

  def render_main_layout_if_format_html
    # check the request format
    if request.format.symbol == :html
      render "layouts/application"
    end
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :done]
  # INCSEUD
  # index
  def index
    @tasks = Task.all
  end
  # show
  def show
  end
  # new
  def new
    @task = Task.new
  end
  # create
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task.id)
  end
  # edit
  def edit
  end
  # update
  def update
    @task.update(task_params)
    redirect_to task_path(@task.id)
  end
  # destroy
  def destroy
    @task.destroy
    redirect_to index_path
  end

  def done
    @task.completed = true
    redirect_to task_path(@task.id)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

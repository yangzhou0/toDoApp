class TasksController < ApplicationController
  before_action :find_task, only:[:edit,:update,:show, :destroy, :complete, :undone]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      flash.now[:errors] = @task.errors.full_message
      render :new
    end
  end

  def edit

  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url
  end

  def show
    @sub_tasks = @task.sub_tasks
  end

  def index
    @done_tasks = Task.all.select{|task| task.done == true}
    @undone_tasks = Task.all.select{|task| task.done == false}
  end

  def destroy

    @task.destroy!
    redirect_to tasks_url
  end

  def complete
    @task.update!(done:true)
    redirect_to tasks_url
  end

  def undone
    @task.update!(done:false)
    redirect_to tasks_url
  end

  private
  def task_params
    params.require(:task).permit(:title,:body,:done)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end

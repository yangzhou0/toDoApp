class SubTasksController < ApplicationController
  before_action :find_sub_task, only:[:edit,:update,:show, :destroy, :complete, :undone]
  def new
    @sub_task = SubTask.new(task_id: params[:task_id])


  end

  def create
    @sub_task = SubTask.new(sub_task_params)
    if @sub_task.save!
      redirect_to task_url(@sub_task.task)
    else
      flash.now[:errors]=@sub_task.errors.full_message
      render :new
    end

  end

  def edit
  end

  def update
    @sub_task.update!(sub_task_params)
    redirect_to task_url(@sub_task.task)
  end

  def show
  end


  def destroy
  end

  def complete
    @sub_task = SubTask.find(params[:id])
    @sub_task.update!(done:true)
    redirect_to task_url(@sub_task.task)
  end

  def undone
    @sub_task = SubTask.find(params[:id])
    @sub_task.update!(done:false)
    redirect_to task_url(@sub_task.task)
  end

  private

  def sub_task_params
    params.require(:sub_task).permit(:title,:body,:task_id)
  end

  def find_sub_task
    @sub_task = SubTask.find(params[:id])
  end
end

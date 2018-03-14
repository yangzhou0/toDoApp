class SubTasksController < ApplicationController
  def new
    @sub_task = SubTask.new(task_id: params[:id])


  end

  def create
    @sub_task = SubTask.new(sub_task_params)

  end

  def edit
  end

  def update
  end

  def show
  end


  def destroy
  end

  def complete
  end

  def undone
  end

  private

  def sub_task_params
    params.require(:sub_tasl).permit(:title,:body,:task_id)
  end
end

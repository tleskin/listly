class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task.list
    else
      render :new
      flash[:error] = "Invalid Task"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :due_date, :list_id)
  end
end

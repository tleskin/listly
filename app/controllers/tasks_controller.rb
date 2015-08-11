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
      flash.now[:error] = @task.errors.full_messages.join(", ")
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :start_date, :due_date, :list_id)
  end
end

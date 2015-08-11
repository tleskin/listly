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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task.list
    else
      flash[:error] = @task.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
     @task = Task.find(params[:id])
     list = @task.list
     @task.destroy
     redirect_to list
   end

  private

  def task_params
    params.require(:task).permit(:title, :body, :start_date, :due_date, :list_id)
  end
end

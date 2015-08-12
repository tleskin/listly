class UserMailer < ApplicationMailer
  def new_task(email, task)
    @task = task

    mail(to: email, subject: "You've got a new task! #{@task.title}")
  end

  def update_task(email, task)
    @task = task

    mail(to: email, subject: "You've got an updated task! #{@task.title}")
  end
end

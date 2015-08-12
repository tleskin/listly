$(document).ready(function() {
  var $taskDiv = $(".each-task");

  $('.change-status').on('click', function() {
    var id = $(this).data().changeStatus;
    $(this).parent().parent().remove();

    $.post("/change", { id: id }).then(function(task){
      $taskDiv.append(
        "<div class='task'><div class='complete'>"
        + "<h3>Title: <span class='title'>"
        + task.title
        + "</span></h3><p>Body: <span class='description'>"
        + task.body
        + "</span></p><p>Start Date: <span class='start-date'>"
        + task.start_date
        + "</span></p><p>Due Date: <span class='due-date'>"
        + task.due_date
        + "</span></p><p><button class='change-status' data-change-status='"
        + task.id
        + "' >Status:complete</button></p><p><a href='/lists/"
        + task.list_id
        + "/tasks/"
        + task.id
        + "/edit'>Edit Task</a></p><p><a rel='nofollow' data-method='delete' href='/lists/"
        + task.list_id
        + "/tasks/"
        + task.id
        + "'>Delete Task</a></p></div></div>")
    });
  });
});

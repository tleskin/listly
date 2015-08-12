$(document).ready(function() {
  var $taskDiv = $(".each-task");

  $('.change-status').on('click', function() {
    var id = $(this).data().changeStatus;
    $(this).parent().parent().remove();

    $.post("/change", { id: id }).then(function(task){

      $taskDiv.append(
        "<div class='task' ><div class='"
          + task.status
          +"'><h3>"
          + task.title
          + "</h3><p>"
          + task.body
          + "</p><p>Start Date: "
          + task.start_date
          + "</p><p>Due Date: " + task.due_date
          + "</p><p>Status: <h4>"
          + task.status
          + "</h4></p><p><button class='change-status' data-change-status='"
          + task.id
          + "' >Change Status</button></p><p><a href='/lists/"
          + task.list_id
          + "/tasks/"
          + task.id
          + "/edit'>Edit Task</a></p><p><a rel='nofollow'" +
          " data-method='delete' href='/lists/"
          + task.list_id
          + "/tasks/"
          + task.id
          + "'>Delete Task</a></p></div></div>")
    });
  });
});

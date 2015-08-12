$(document).ready(function() {

  $(".task-status").on('click', function(data) {
    data.preventDefault();

      var currentStatus = $(this).html();
      var taskId        = $(this).data("id");
      var taskStatus    = null

      if (currentStatus === "incomplete"){
        $(this).html("complete");
        taskStatus = "complete";
        $(this).parent().parent().toggleClass("incomplete complete");
      } else if ($(currentStatus === "complete")) {
          $(this).html("incomplete");
          taskStatus = "incomplete";
          $(this).parent().parent().toggleClass("complete incomplete");
      }

      $.ajax({
        type: "POST",
        url: "/change",
        dataType: "json",
        data:{
          "task_id": taskId,
          "status": taskStatus
        }
      })
  })
});

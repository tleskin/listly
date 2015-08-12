// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
  var $taskDiv = $(".each-task");

  $('.show-all').on('click', function() {
    $(".complete").toggle();
  });

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

           $(".change-status").on("click", deleteReAdd);
    });
  });


function deleteReAdd() {

  var $taskDiv = $(".each-task");

  $('.show-all').on('click', function() {
    $(".complete").toggle();
  });

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
}



});

$(document).ready(function() {
  $('.show-all').on('click', function() {
    $(".complete").toggle();
  });

  $('.show-future').on('click', function() {
    $(".show-future-tasks").toggle();
  });
});

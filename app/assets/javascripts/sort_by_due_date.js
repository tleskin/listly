$(document).ready(function() {
  $('.sort-by-due-date').on('click', function() {
    var $sortedTasks = $('.each-task').children().sort(function(x, y) {
      return $(x).find('.due-date').html() > $(y).find('.due-date').html();
    });
    $('.each-task').html($sortedTasks);
  });
});

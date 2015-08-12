$(document).ready(function() {
  $('.sort-by-title').on('click', function() {
    var $sortedTasks = $('.each-task').children().sort(function(x, y) {
      return $(x).find('.title').html() > $(y).find('.title').html();
    });
    $('.each-task').html($sortedTasks);
  });
});

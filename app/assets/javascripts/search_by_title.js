$(document).ready(function() {
  function findMatch(element, searchTerm) {
      var output = false;
      $(element).children().each(function (index, element) {
        if ($(element).html().match(searchTerm)) {
          output = true;
        }
      });
      return output;
    }

    $('.name-search').on('keyup', function() {
      var searchTerm = new RegExp($(".name-search").val());
      $('.each-task').children().each(function(index, element) {
        if (findMatch(element, searchTerm)) {
          $(element).show();
        } else {
          $(element).hide();
        }
      });
    });
});

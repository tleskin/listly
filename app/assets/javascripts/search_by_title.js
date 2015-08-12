$(document).ready(function() {
  function findMatch(element, searchTerm) {
      var output = false;
      debugger;
      $(element).children().each(function (i, e, a) {
        if ($(e).html().match(searchTerm)) {
          output = true;
        }
      });
      return output;
    }

    $('.name-search').on('keyup', function() {
      var searchTerm = new RegExp($(".name-search").val(), "i");
      debugger;
      $('.each-task').children().each(function(index, element) {
        if (findMatch(element, searchTerm)) {
          $(element).show();
        } else {
          $(element).hide();
        }
      });
    });
});

/* eslint-disable no-undef */
$(document).ready(function () {
  var source = $('#autocomplete').data('goiy');
  $('#autocomplete').autocomplete({
    source: function (request, response) {
      var term = $.ui.autocomplete.escapeRegex(request.term),
        startsWithMatcher = new RegExp('^' + term, 'i'),
        startsWith = $.grep(source, function(value) {
          return startsWithMatcher.test(value.label || value.value || value);
        }),
        containsMatcher = new RegExp(term, 'i'),
        contains = $.grep(source, function (value) {
          return $.inArray(value, startsWith) < 0 &&
          containsMatcher.test(value.label || value.value || value);
        });

      response(startsWith.concat(contains));
    }
  });
});

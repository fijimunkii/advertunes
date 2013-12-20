$(function() {
  $('#genre_name').on('change', function(e) {
    var genre = $(this).val();
    location = '/music/genre/' + genre;
    fadeOutIn('container','loading');
  });
});

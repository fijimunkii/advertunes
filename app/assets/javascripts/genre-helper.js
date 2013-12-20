$(function() {
  $('#genre_name').on('change', function(e) {
    var genre = $(this).val();
    location = '/music/genre/' + genre;
    $('#container').fadeOut(1000,function() {
      $('#loading').fadeIn(1000);
    });
  });
});

$(function() {
  $('#popularity').on('change', function(e) {
    location = '/music/' + $(this).val();
    $('#container').fadeOut(1000,function() {
      $('#loading').fadeIn(1000);
    });
  });
});

$(function() {
  $('#popularity').on('change', function(e) {
    location = '/music/' + $(this).val();
  });
});

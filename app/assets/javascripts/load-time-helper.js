$(function() {

  $('.wait-on-click').on('click', function() {
    $('#container').fadeOut(1000,function() {
      $('#loading').fadeIn(1000);
    });
  });

});

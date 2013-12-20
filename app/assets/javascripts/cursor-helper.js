$(function() {

  $('.wait-on-click').on('click', function() {
    $('body').css({'cursor':'wait'});
    $('.wait-on-click').css({'cursor':'wait'});
    $('.call-to-action-btn').css({'cursor':'wait'});
  });

});

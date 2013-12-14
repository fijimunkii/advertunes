$(function() {
  var $email = $('#email');
  if ($email.length == 1) {
    $email.focus();
    focusZoom.trigger($email[0]);
  }
  $('a').smoothScroll();
});

$(document).ready(function(){

  App.router = new App.Router();

  $('.call-to-action button').on('click', function() {
    var $email = $('#email');
    $email.focus();
    focusZoom.trigger($email[0]);
  });

});

$(document).ready(function(){

  App.router = new App.Router();

  var $email = $('#email');
  $email.focus();
  focusZoom.trigger($email[0]);

  $('a').smoothScroll();

  $(".connect-with-soundcloud a.connect").on("click", function(e){
    e.preventDefault();
    SC.Connect.open({
      redirectEndpoint: "/soundcloud/connect",
      error: function(reason){
        console.log("SoundCloud Connect failed: "+ reason);
      },
      success: function(){
        this.client.get("/me", function(me){
          $(".connect-with-soundcloud").addClass("connected");
          $(".visible-when-logged-in").removeClass("hidden");

          $(".connect-with-soundcloud .username").html(me.username);
        });
      }
    });
  });

});

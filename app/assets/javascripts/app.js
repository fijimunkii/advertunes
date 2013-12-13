$(document).ready(function(){

  App.router = new App.Router();

  var $email = $('#email');
  $email.focus();
  focusZoom.trigger($email[0]);

  $('a').smoothScroll();

  SC.Connect.options = {
    'request_token_endpoint': '/soundcloud/connect',
    'access_token_endpoint': '/soundcloud/connect',
    'callback': function(query_obj){
      console.log(query_obj);
    }
  };

  $(".connect-with-soundcloud a.connect").on("click", function(e){
    e.preventDefault();
    SC.Connect.initiate({
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

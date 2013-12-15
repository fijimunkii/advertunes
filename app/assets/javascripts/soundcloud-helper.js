$(function() {

  SC.Connect.options = {
    'request_token_endpoint': '/soundcloud/connect',
    'access_token_endpoint': '/soundcloud/connect',
    'callback': function(query_obj){
      console.log(query_obj);
    }
  };

  $('.soundcloud-connect').on('click', function() {
    SC.Connect.initiate();
  });

});

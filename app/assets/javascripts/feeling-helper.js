$(function() {

  function iGotAfeeling(info) {
    return $.ajax({
      url: '/feelings/' + info.id + '/' + info.feeling,
      type: 'POST'
    });
  }

  $('.feeling-form').on('submit', function(e) {
    e.preventDefault();
    var $feeling = $(this.children[1]),
        id = $feeling.attr('data-id'),
        info = { id: id, feeling: $feeling.val()};

    iGotAfeeling(info).done(function(data) {
      $feeling.val('');
      //TODO: flash feeling added
    });

  });

});

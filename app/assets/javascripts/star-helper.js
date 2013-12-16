$(function() {

  function starToggle(id) {
    return $.ajax({
      url: '/stars/toggle/' + id,
      type: 'POST'
    });
  }

  $('.star').on('click', function(e) {
    var star = $(this);
    var id = star.attr('data-id');

    starToggle(id).done(function(data) {
      if (data.on) {
        star.removeClass('star-off');
        star.addClass('star-on');

        var numStars = star.prev();
        var amountOfStars = parseInt(numStars.html());
        numStars.html(amountOfStars + 1);

      } else {
        star.removeClass('star-on');
        star.addClass('star-off');

        var numStars = star.prev();
        var amountOfStars = parseInt(numStars.html());
        numStars.html(amountOfStars - 1);
      }
    });
  });

});

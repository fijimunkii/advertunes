$(function() {


  function toggleTrack(info) {
    return $.ajax({
      url: '/songs/toggle/' + info.artist + '/' + info.title + '/' + info.permalink + '/' + info.genre + '/' + info.description,
      type: 'POST'
    });
  }

  $('.track').on('click', function(e) {
    var info = {
      artist: encodeURIComponent($(this).attr('data-artist')),
      title: encodeURIComponent($(this).attr('data-title')),
      permalink: encodeURIComponent($(this).attr('data-permalink')),
      genre: encodeURIComponent($(this).attr('data-genre')),
      description: encodeURIComponent($(this).attr('data-description'))
    }

    var track = this;

    toggleTrack(info).done(function(data) {
      if (data.on) {
        $(track.children[0]).removeClass('off');
        $(track.children[0]).addClass('on');
      } else {
        $(track.children[0]).removeClass('on');
        $(track.children[0]).addClass('off');
      }
    });
  });


});

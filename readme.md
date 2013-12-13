Advertunes
==========
*royalty-free music licensed for advertising*


* ideal for advertisers
* ideal for indie musicians

A music licensing platform for indie artists to get their music out in the world. Advertisers can search through user curated, pre-licensed music for their ads. Artists can put their music up for grabs and maybe they will have produced the background track of a hit commercial.


User Stories
============

As an unregistered user

* I want visit the webpage and be presented with a nice splash page explaining the mission of the site
* I want to load the player page where I can listen to music that has been added to the site
* I want to register an account, so I can add music to the site

As an authorized user

* I want to tag tracks with feelings
* I want to create playlists
* I want to send a track to a friend

As an authorized user (musician)

* I want to add my music to the site, so that advertisers might use it
* I want to see how many times my tracks have been played

As an authorized user (advertiser)

* I want to indicate that I am going to use a track in an ad



Data Models
===========

users

* email
* password_digest
* sc_access_token
* sc_refresh_token
* sc_expires_at
* sc_username
* sc_id

songs

* name
* artist
* permalink
* description
* num_stars

feelings

* name

feelings_songs

* feeling_id
* song_id

genres

* name

genres_songs

* genre_id
* song_id

stars

* song_id
* user_id


Gems
====

soundcloud


TESTING ZONE
=============

http://developers.soundcloud.com/docs#authentication

http://creativecommons.org/choose/


client = SoundCloud.new({
  :client_id     => ENV['ADVERTUNES_SOUNDCLOUD_ID'],
  :client_secret => ENV['ADVERTUNES_SOUNDCLOUD_SECRET'],
  :username      => 'harrisonpowers@gmail.com',
  :password      => 'XXXXXXXXXX'
})

user.soundcloud_access_token = client.access_token
user.soundcloud_refresh_token = client.refresh_token
user.soundcloud_expires_at = client.expires_at
user.soundcloud_username = client.get('/me').username
user.soundcloud_id = client.get('/me').id

tracks = client.get('/me/tracks').map do |track|
  {
    id: track.id,
    permalink: track.permalink,
    genre: track.genre,
    description: track.description
  }
end



embed_info = client.get('/oembed', :url => track_url)

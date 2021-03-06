# == Route Map (Updated 2013-12-14 12:17)
#
#                  root      /                                                                     welcome#index
#              register POST /register(.:format)                                                   welcome#register
#                   you      /you(.:format)                                                        welcome#show
#            you_update      /you/update(.:format)                                                 welcome#update
#                       POST /songs/toggle/:artist/:track/:permalink/:genre/:description(.:format) songs#toggle
#    soundcloud_connect      /soundcloud/connect(.:format)                                         soundcloud#connect
#  soundcloud_connected      /soundcloud/connected(.:format)                                       soundcloud#connected
# soundcloud_disconnect      /soundcloud/disconnect(.:format)                                      soundcloud#disconnect
#      soundcloud_music      /soundcloud/music(.:format)                                           soundcloud#music
#

Advertunes::Application.routes.draw do
  root to: 'welcome#index'

  get '/music', to: 'songs#index'
  get '/music/feeling/:feeling', to: 'songs#feeling'
  get '/music/genre/:genre', to: 'songs#genre'
  get '/music/bottom', to: 'songs#bottom'
  get '/music/top', to: 'songs#top'
  get '/music/:id', to: 'songs#single'

  post '/songs/toggle/:artist/:track/:permalink/', to: 'songs#toggle'
  post '/songs/toggle/:artist/:track/:permalink/:genre', to: 'songs#toggle'
  post '/songs/toggle/:artist/:track/:permalink/:genre/:description', to: 'songs#toggle'

  post '/feelings/:song_id/:feeling', to: 'feelings#create'
  post '/stars/toggle/:song_id', to: 'stars#toggle'

  match '/soundcloud/connect',    to: 'soundcloud#connect',    :as => :soundcloud_connect
  match '/soundcloud/connected',  to: 'soundcloud#connected',  :as => :soundcloud_connected
  match '/soundcloud/disconnect', to: 'soundcloud#disconnect', :as => :soundcloud_disconnect
  match '/soundcloud/music',      to: 'soundcloud#music',      :as => :soundcloud_music
end

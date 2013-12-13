Advertunes::Application.routes.draw do
  root to: 'welcome#index'

  post '/register', to: 'welcome#register'

  match '/you',           :to => 'welcome#show',    :as => :you
  match '/you/update',    :to => 'welcome#update',  :as => :you_update

  match '/soundcloud/connect',    :to => 'soundcloud#connect',    :as => :soundcloud_connect
  match '/soundcloud/connected',  :to => 'soundcloud#connected',  :as => :soundcloud_connected
  match '/soundcloud/disconnect', :to => 'soundcloud#disconnect', :as => :soundcloud_disconnect
end

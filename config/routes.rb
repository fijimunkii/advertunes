Advertunes::Application.routes.draw do
  root to: 'welcome#index'

  post '/register', to: 'welcome#register'
end

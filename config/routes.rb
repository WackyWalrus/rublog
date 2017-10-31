Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#startup'

  get '/posts/:id', to: 'app#post', as: 'post'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  get '/users/login', to: 'users#show_login', format: false
  post '/users/login', to: 'users#do_login', format: false
  post '/users/logout', to: 'users#do_logout', format: false

  get '/admin', to: 'admin_panel#index', as: 'index_admin_panel', format: false

  get '/admin/account', to: 'admin_panel#account', as: 'account_admin_panel', format: false
  patch '/admin/account', to: 'admin_panel#update_account', as: 'update_account_admin_panel', format: false

  get '/admin/users', to: 'admin_panel#users', as: 'users_admin_panel', format: false

  get '/admin/settings', to: 'admin_panel#settings', as: 'settings_admin_panel', format: false

  get '/admin/posts', to: 'admin_panel#index', as: 'posts_admin_panel'
  get '/admin/posts/new', to: 'admin_panel#new_post', as: 'new_post_admin_panel', format: false
  get '/admin/posts/edit', to: 'admin_panel#edit_post', as: 'edit_post_admin_panel'
  post '/admin/posts', to: 'admin_panel#save_post', as: 'save_post_admin_panel', format: false
  patch '/admin/posts', to: 'admin_panel#update_post', as: 'update_post_admin_panel'
  delete '/admin/posts', to: 'admin_panel#delete_post', as: 'delete_post_admin_panel'

  patch '/data/save', to: 'data#save', as: 'data_save'
end
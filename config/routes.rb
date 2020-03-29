Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'

  post 'home/index'

  root 'home#index'

  get 'home/about'

  get 'me/pagetest'

  get 'home/about', to: 'home#about', as: 'aboutit'

  get 'home/lumptest'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

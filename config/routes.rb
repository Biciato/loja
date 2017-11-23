Rails.application.routes.draw do
  

  resources :usuarios
  resources :produtos
  

  resources :pedidos
  resources :linha_items
  resources :carrinhos
  root 'loja#index', as: 'loja_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

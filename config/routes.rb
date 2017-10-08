Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :usuarios
  resources :pedidos
  resources :linha_items
  resources :carrinhos
  root 'loja#index', as: 'loja_index'

  resources :produtos do
    get :quem_comprou, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

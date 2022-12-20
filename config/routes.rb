Rails.application.routes.draw do
  root to: 'pages#home'

  resources :municipes do
    collection do
      get :search
    end
    member do
      get :delete_foto_attached
    end
  end

  resources :enderecos
  get :estados, controller: :brasil_api
  get :municipios, controller: :brasil_api
  get :cep, controller: :brasil_api
end

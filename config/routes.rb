Rails.application.routes.draw do

  resources :municipes do
    collection do
      get :search
    end
    member do
      get :delete_foto_attached
    end
  end
  root to: 'pages#home'

  get :estados, controller: :brasil_api
  get :municipios, controller: :brasil_api
  get :cep, controller: :brasil_api
end

Rails.application.routes.draw do
  root to: 'bixes#index'
  resources :bixes, only: [] do
    collection do
      resources :confirmacoes, only: %i(index)
      get :emails
    end

    member do
      resources :confirmacoes, only: %i(create)
    end
  end

  get '/bixes/contatos' => 'bixes#contatos', as: :contatos
  get '/bixes/:id/modalidades' => 'bixes#modalidades', as: :edit_bixe_modalidades
  post '/bixes/:id/modalidades' => 'bixes#modify_modalidades', as: :modify_bixe_modalidades

  get '/modalidades/contatos' => 'modalidades#contatos', as: :contato_modalidades
  resources :bixes, except: [:edit]
  resources :modalidades
end

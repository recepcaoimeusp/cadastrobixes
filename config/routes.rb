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
  get '/bixes/:id/items' => 'bixes#items', as: :edit_bixe_items
  post '/bixes/:id/modalidades' => 'bixes#modify_modalidades', as: :modify_bixe_modalidades
  post '/bixes/:id/items' => 'bixes#modify_items', as: :modify_bixe_items

  get '/modalidades/contatos' => 'modalidades#contatos', as: :contato_modalidades
 
  get '/items/:id/bixes' => 'items#bixes', as: :edit_item_bixes
  get '/items/contatos' => 'items#contatos', as: :contato_items
  get '/items/planilha' => 'items#planilha', as: :planilha_items
  resources :bixes, except: [:edit]
  resources :modalidades
  resources :items
end

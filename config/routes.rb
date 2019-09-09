Rails.application.routes.draw do

  get 'entries/create'
  # Root
  root 'main#index'

  # Entries
  resources :entries

end

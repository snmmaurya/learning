Rails.application.routes.draw do
  resources :welcome, only: [:index]

  root "welcome#index"

  # resources :animals
  resources :lions, controller: "animals", type: "Lion" # type is extra parameter with value Lions
  resources :horses, controller: "animals", type: "Horse" # type is extra parameter with value Horse
end
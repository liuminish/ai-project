Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'chats#index'

  resources :chats do
    post :start_new, on: :collection
    post :add_message, on: :member
  end
  resources :messages
  # TODO: tidy resources
end

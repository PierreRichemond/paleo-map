Rails.application.routes.draw do
  root to: 'dinosaurs#index'
  get '/tagged', to: "dinosaurs#tagged", as: :tagged
  resources :dinosaurs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

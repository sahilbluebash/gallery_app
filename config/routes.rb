Rails.application.routes.draw do
  
  resources :imagegalleries
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'imagegalleries#showallimages'


 # get 'tags/:tag', to: 'imagegalleries#tagged',as: :tag
  get "/showallimages" => "imagegalleries#showallimages"
  get '/tagged', to: "imagegalleries#tagged", as: :tagged 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


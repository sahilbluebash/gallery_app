Rails.application.routes.draw do
  
  resources :imagegalleries
  root 'imagegalleries#showallimages'
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :imagegalleries do
    member do
    delete :delete_upload
    end
  end


 # get 'tags/:tag', to: 'imagegalleries#tagged',as: :tag
  get "/showallimages" => "imagegalleries#showallimages"
  get '/tagged', to: "imagegalleries#tagged", as: :tagged 
  get '/showgallery' , to: "imagegalleries#showgallery"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


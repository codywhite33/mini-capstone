Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/n64" => "products#nint"
    get "/all_products" => "products#all"
    get "/cube" => "products#cube"
    get "/snes" => "products#snes"
  end
end

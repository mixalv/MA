Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/user/:user_id/post", to: "posts#create"
  put "/user/:user_id/post/:id", to: "posts#update"
  delete "/user/:user_id/post/:id", to: "posts#delete"
  get "/post/:id", to: "posts#show"
  get "/posts", to: "posts#get_by"

  post "/user/:user_id/comment", to: "comments#create"

  post "/user", to: "users#create"



end

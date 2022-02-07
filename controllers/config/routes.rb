Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Endpoints for posts controller
  post "/user/:user_id/post", to: "posts#create"
  put "/user/:user_id/post/:id", to: "posts#update"
  delete "/user/:user_id/post/:id", to: "posts#delete"
  get "/post/:id", to: "posts#show"
  get "/user/:id/posts", to: "posts#get_by"
  get "/user/:user_id/posts/orderedByDate", to: "posts#ordered_by_date"

  # Endpoints for comments controller
  post "/user/:user_id/comment", to: "comments#create"

  # Endpoints for users controller
  post "/user", to: "users#create"

end

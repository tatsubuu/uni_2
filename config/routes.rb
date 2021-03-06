Rails.application.routes.draw do
    
    
    root to: "home#top" 
    
    post "courses/:lesson_id/create" => "courses#create"
    post "courses/:lesson_id/destroy" => "course#destroy"
    
    get 'users/index' => "users#index"
    get "users/signup" => "users#new"
    get "login" => "users#login_form"
    get "users/:id/edit" => "users#edit"
    
    
    get "users/:id" => "users#show"
    
    post "users/create" => "users#create"
    post "users/:id/update" => "users#update"
    post "login" => "users#login"
    post "logout" => "users#logout"
    post "users/:id/destroy" => "users#destroy"
    
    get 'lessons/index' => "lessons#index"
    get "lessons/new" => "lessons#new"
    get "lessons/:id" => "lessons#show"
    
    
    post "lessons/create" => "lessons#create"
    post "lessons/:id/destroy" => "lessons#destroy"
    
    get "posts/:id/edit" => "posts#edit"
    get "posts/:id/new" => "posts#new"
    get 'posts/:id' => "posts#show"
    
    
    post "posts/:id/create" => "posts#create"
    post "posts/:id/update" => "posts#update"
    post "posts/:id/destroy" => "posts#destroy"
    
    post "likes/:post_id/create" => "likes#create"
    post "likes/:post_id/destroy" => "likes#destroy"
    
    get "top" => "home#top"

  
    
    
  
end

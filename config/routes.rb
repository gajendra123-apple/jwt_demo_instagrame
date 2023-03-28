Rails.application.routes.draw do
 #root "users#index"

 resources :users
  
   get'/users',to:"users#show"
   put'/users/:id',to:"users#update"
   delete'/users',to: "users#destroy"
   post '/auth/login',to: 'authentication#login'

 #resources :posts
   post'/posts/:id',to:"posts#create"
   get'/posts', to:"posts#show"
   put'/posts/:id',to:"posts#update"
   delete'/posts/:id',to:"posts#delete"
   get'/posts',to:"posts#index"

 
 # resources :comments
    #comment'/comments',to:"comment#create"
    root "comments#create"
    #root "comments#index"
     get'/comments',to:"comments#index"
     get'/comments/:id',to:"comments#show"
     put'/comments/:id',to:"comments#update"
     delete'/comments/:id',to:"comments#destroy"
     post'/comments/:id',to:"comments#create_reply"
  
  # resources :likes
    post'/likes',to:"likes#create"
    get'/likes',to:"likes#index"
    get'/likes/:id',to:"likes#show"
    delete'/likes/:id',to:"likes#destroy"
    put'/likes/:id',to:"likes#update"
  

      



end
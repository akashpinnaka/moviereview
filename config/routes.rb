Rails.application.routes.draw do


resources :movies do
  member do
    get 'upvote'
    get 'downvote'
  end
end

root 'movies#index'



 
end

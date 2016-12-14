Rails.application.routes.draw do
    resources :bucketlists, except: [:new, :edit] do
      resources :items, except: [:new, :edit]
    end

    post "signup", to: "users#create"
    post "auth/login", to: "authentication#login"
    get "auth/logout", to: "authentication#logout"

end

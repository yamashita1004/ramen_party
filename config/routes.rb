Rails.application.routes.draw do


  namespace :admin do

    resources :ramens, only: [:index, :show, :edit, :destroy]
    delete '/ramens/destroy_all' => 'ramens#destroy_all', as: 'destroy_all_ramens'
    resources :users, only: [:index, :show, :edit]
  end
   namespace :public do
    root 'homes#top'
    get '/users/quit' => 'users#quit'
    patch 'users/out' => 'users#out'
    resources :users, only: [:index, :show, :edit, :update,]


     resources :ramens ,only: [:new, :index, :show, :edit, :update, :destroy, :create]



  end
# 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end

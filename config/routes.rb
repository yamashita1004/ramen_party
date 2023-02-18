Rails.application.routes.draw do
  scope module: :public do
    root 'homes#top'

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

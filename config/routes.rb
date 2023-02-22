Rails.application.routes.draw do


   scope module: :public do
    root 'homes#top'
     get 'users/mypage' => 'users#show', as: 'mypage'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'uses/information/edit' => 'users#edit', as: 'edit_information'
    patch 'uses/information' => 'users#update', as: 'update_information'
    get 'users/quit' => 'users#quit', as: 'confirm_quit'
    put 'users/information' => 'users#update'
    patch 'users/out' => 'users#out', as: 'out_user'


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

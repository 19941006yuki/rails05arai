Rails.application.routes.draw do
  get 'sessions/new'
  get 'pages/help'
  root 'pages#index'
  
  resources :users
  
  get    '/login',   to: 'sessions#new' 
  #取得。ログインするページを表示するだけなのでゲット
  post   '/login',   to: 'sessions#create'
  #作成。ユーザから受け取ったデータをもとにSessionを作成するのでpost
  delete '/logout',  to: 'sessions#destroy'
  #ログアウトする際。
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=begin
resource :--と指定する事で、index、show、new、edit、create、update、destroyアクションを
個別に宣言しなくても1行で宣言が完了
=end
end

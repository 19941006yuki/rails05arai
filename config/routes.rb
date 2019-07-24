Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'pages/help'
  root 'pages#index'

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
  resources :users
  resources :topics
  resources :comments
  
  get 'favorites/index'
  #なぜtopicsと同じ画面に行くのか
  post '/favorites', to: 'favorites#create'
  get 'comments/new', to: 'comments#new'
  #入力画面はnewで、
  post '/comments', to: 'comments#create'
  #なぜget post二つルーティング設定するのか
end

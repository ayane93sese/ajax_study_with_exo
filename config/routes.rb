Rails.application.routes.draw do
  root to: 'posts#index'
  post 'posts', to: 'posts#create'
  #↓既読機能のエンドポイントを記述してるらしいけど、正直この記述がよく分からん(笑)
  get 'posts/:id', to: 'posts#checked'
end

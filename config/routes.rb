Rails.application.routes.draw do
  # devise を使用する際に URL として users を含む
  devise_for :users
  root to: 'homes#top'
  # メソッド'URL' => 'こんとろーる＃あくしょん'，as:'名前付きルート'
  get 'homes/about' => 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

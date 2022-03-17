Rails.application.routes.draw do

  root to: 'homes#top'

  # devise を使用する際に URL として users を含む
  devise_for :users

  resources :post_images, only: [:new, :create, :index, :show, :destroy]do
  resource :favorites, only: [:create, :destroy]
   # コメントは、投稿画像に対してコメントされます。このため、post_commentsは、post_imagesに結びつきます。
  resources :post_comments, only: [:create, :destroy]
end

  resources :users, only: [:show, :edit, :update]




  # メソッド'URL' => 'こんとろーる＃あくしょん'，as:'名前付きルート'
  get 'homes/about' => 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

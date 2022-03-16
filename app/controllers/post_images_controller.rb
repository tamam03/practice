class PostImagesController < ApplicationController


  def new
    @post_image = PostImage.new
    # @post_image は、PostImage.new によって生成された、PostImage の空のモデル
  end


  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # （モデル名．カラム名） user_id としてcurrent_user.id の値を代入する
    # current_user deviseヘルパーメソッド...ログイン中のユーザーの情報を取得
    @post_image.save
    redirect_to post_images_path
  end


  def index
    @post_images = PostImage.all
  end

  def show
  end


  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end




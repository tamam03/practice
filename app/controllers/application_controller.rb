class ApplicationController < ActionController::Base
  # ストロングパラメータと同様の機能
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
# configure_permitted_parametersメソッドが実行されます。
   before_action :configure_permitted_parameters, if: :devise_controller?
# サインインできたらaboutページ遷移
# after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッドです。
  # after_sign_in_path_forは、Deviseの初期設定ではroot_path

  def after_sign_in_path_for(resource)
      about_path
  end

  #上記のような記述をすることで、初期設定を上書き

  def after_sign_out_path_for(resource)
    about_path
  end

  # サインアウト後Aboutページへ遷移


# protectedは呼び出された他のコントローラからも参照することができます。
  protected
# configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
# ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

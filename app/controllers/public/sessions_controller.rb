# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  before_action :reject_inactive_user, only: [:user]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
   protected
   def after_sign_in_path_for(resource)
   public_ramens_path
   end

   def after_sign_out_path_for(resource)
   public_root_path
   end
   protected
 ##退会しているかを判断するメソッド
def reject_inactive_user
   ##【処理内容1】 入力されたemailからアカウントを1件取得
  @user = User.find_by(email: params[:user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @user.valid_password?(params[:user][:password]) && @user.is_active
    flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
    redirect_to new_user_session_path## 【処理内容3】
  end
end
end

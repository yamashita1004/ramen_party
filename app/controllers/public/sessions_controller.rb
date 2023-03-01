# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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
   new_user_session_path
   end
   #protected
# 退会しているかを判断するメソッド
#def user_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  #@user = User.find_by(email: params[:user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  #return if !@user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  #if @user.valid_password?(params[:user][:password]) && @user.is_deleted
    #redirect_to new_user_session_path## 【処理内容3】
  #end
#end
end

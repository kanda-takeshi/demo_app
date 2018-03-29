class RegistrationsController < Devise::RegistrationsController

      def after_sign_up_path_for(resource)
        user_path(resource)
      end

  private

      #4つのパラメータしか受け取らない設定している（sign_up_params）
      #5、6つ目のデータが来ても、弾くようにする設定。
      #受け取ってしまったらサーバダウンにつながる
      def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
      
      def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
      end
end
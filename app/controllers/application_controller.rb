class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise_controller(ユーザー登録、ログイン認証機能)が使われる前に
  # configure_permitted_parametersを実行する
  
  def after_sign_in_path_for(resorce)
    post_images_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # configure_permitted_parametersを定義
    # devise_parameter_sanitizerでnameのデータ操作を許可
    #（ユーザー登録（sign_up）の際に、ユーザー名(name)が許可
  end
end

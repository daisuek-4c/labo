class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_authentication

  def check_authentication
    logger.debug "session check before action : start"
 
#    session["cloudn.rdb"] =true
 
    # OPへリダイレクト 
    return redirect_openid_redirect_url if session["cloudn.rdb"].nil?
 
    # セッションにAPIキー情報は入れないので、都度API実行で取得
    api_key = get_api_key
    @api_access_key = "hogehoge"
    @api_secret_access_key = "fugafuga"
 
    logger.debug @api_access_key
    logger.debug @api_secret_access_key
 
    logger.debug "session check before action : end"
  end

  def redirect_openid_redirect_url
      begin
        # リダイレクトURLを取得
        redirect_url = openid_request
        logger.debug "redirect because of session is nil."
        logger.debug redirect_url
 
      rescue
        logger.fatal "hoge"
 
      else
        redirect_to redirect_url
 
      end
  end

  # ここは、OpenID用の別クラスに切り出す
  def openid_request
    return "http://www.google.co.jp/"
  end
 
  # ここは、キー取得用の別クラスに切り出す
  def get_api_key
 
  end

end

module SessionsHelper
  def sign_in(user)
    # 一時セッションを作成
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    # session[:user_id]が存在するか
    if (user_id = session[:user_id])
      # cookieから送られてきたuser_idがデータベースにあれば格納される
      @current_user = User.find(user_id)
    end
  end

  def signed_in?
    !current_user.nil?
  end
end

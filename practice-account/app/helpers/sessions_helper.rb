module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id ||= User.find_by()
  end
end

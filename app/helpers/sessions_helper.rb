module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out()
    session.delete(:user_id)
  end

  def logged_in?
    bool = true
    if session[:user_id]
      bool = true
    else
      bool = false
    end
  end
end

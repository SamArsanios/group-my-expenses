module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  # def logout_path
  #   return current_user if logged_in?

  #   link_to('Logout', logout_path, method: 'delete', class: 'nav-link') if logged_in?
  #   log_out_path
  # end
end

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

  def logout_link
    content = ''
    if logged_in?
      content << link_to('Logout', logout_path, method: 'delete', class: 'nav-link')
    end
    content.html_safe
  end
end

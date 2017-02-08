module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Destroys the session token
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Looks for the current user or performs a search
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Checks for logged in user or nil
  def logged_in?
    !current_user.nil?
  end
  
end
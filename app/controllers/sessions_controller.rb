class SessionsController < ApplicationController
  def new
  end
  
  def create
    # Email is a nested hash for session and email
    user = User.find_by(email: params[:session][:email].downcase)
    
    # User authentication handles the seeded lookup and confirmation
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # Create an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Calls the log_out session helper method to destroy the session
  def destroy
    if(logged_in?)
      log_out
    end
    
    redirect_to root_url
  end
end

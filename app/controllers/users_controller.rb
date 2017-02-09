class UsersController < ApplicationController
  # Signup new users
  def new
    @user = User.new
  end
  
  # Safely create a new user
  def create
    @user = User.new(user_params)
    
    # If successfully saved, redirect the user to their dashboard
    if @user.save
      flash[:success] = "Welcome to dwellNV!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
    
  end
  
  # Display queried user information
  def show
    @user = User.find(params[:id])
  end
  
  # Ensure user parameters are only for non-admin users
  private
    def user_params
      params.require(:user).permit(:name, :email, :primary_phone, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  # Index page for displaying users list to admins
  def index
    @users = User.paginate(page: params[:page])
  end

  # Signup new users
  def new
    @user = User.new
  end
  
  # Safely create a new user
  def create
    @user = User.new(user_params)
    
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  # Edit the user's data
  def edit
    @user = User.find(params[:id])
  end
  
  # Update the user's data
  def update
    @user = User.find(params[:id])
    
    if current_user.admin? || current_user == @user
      if @user.update_attributes(user_params)
        # User update was successful, no action necessary
        flash[:success] = "Updated profile information"
        redirect_to @user
      else
        render 'edit'
      end
    else
      render 'show'
    end
  end
  
  # Find the user and remove from the database
  def destroy
    user = User.find(params[:id])
    name = user.name
    user.destroy
    
    flash[:success] = "User: #{name} was deleted"
    redirect_to users_url
  end
  
  # Display queried user information
  def show
    @user = User.find(params[:id])
    @ownlistings = @user.listings.where.not("listing_status LIKE ?", "deleted").order(:created_at).paginate(page: params[:page])
    @listings = @user.listings.where.not("listing_status LIKE ?", "deleted").paginate(page: params[:page])
  end
  
  # Ensure user parameters are only for non-admin users
  private
    # Confirms valid user parameters
    def user_params
      params.require(:user).permit(:name, :email, :primary_phone, :password, :password_confirmation,
                                   :admin, :portrait, :team, :biography)
    end
    
    # Ensure accessing users is correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
    end
    
    # Confirms user admin status
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

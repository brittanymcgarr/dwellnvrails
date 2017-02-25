class ListingsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def new
        @listing = Listing.new
    end
    
    def create
        if current_user.admin?
            @listing = current_user.listings.build(listing_params)
            @listing.listing_status = "active"
            
            if@listing.save!
                flash[:success] = "New Listing created!"
                redirect_to root_url
            else
                render 'new'
            end
        else
            flash[:failure] = "You must be an admin to create a listing."
            redirect_to root_url
        end
    end
    
    def show
      @listing = Listing.find(params[:id])
      @user = current_user
    end
    
    def edit
        if current_user.admin?
            @listing = Listing.find(params[:id])
            render 'edit'
        end
    end
    
    def update
        if current_user.admin?
            @listing = Listing.find(params[:id])
            
            if @listing.update_attributes(listing_params)
                flash[:success] = "Updated Listing information"
                redirect_to @listing
            else
                render 'edit'
            end
        end
    end
    
    def destroy
        if current_user.admin?
            @listing.listing_status = "deleted"
            
            if @listing.save!
                flash[:success] = "Listing DELETED"
                redirect_to request.referrer || root_url
            else
                flash[:failure] = "Could not remove listing"
                redirect_to request.referrer || root_url
            end
        end
    end
    
    private
    
    # Check for necessary paramters
    def listing_params
        params.require(:listing).permit(:description, :street_address, :city, :state,
                                        :zip_code, :primary_contact, :secondary_contact,
                                        :listing_status, :asking_price, :renobb, :picture)
    end
    
    # Ensure only the creator of the listing is destroying it
    def correct_user
        @listing = current_user.listings.find_by(id: params[:id])
        
        if current_user.admin?
            return true
        end
        
        redirect_to root_url if @listing.nil?
    end
    
end
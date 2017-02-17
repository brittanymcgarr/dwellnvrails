module ListingsHelper
    def current_listing
        if(listing_id = session[:listing_id])
            @listing ||= Listing.find_by(id: listing_id)
        end
    end
    
    def active_listing?(listing)
        return listing.listing_status != "deleted"
    end
end

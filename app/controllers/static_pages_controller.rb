class StaticPagesController < ApplicationController
  def home
    @listings = Listing.all.where.not("listing_status LIKE ?", "deleted").first(3)
  end

  def contact
    @realtors = User.where('team = ?', true).order("created_at").all
  end
  
  def about
  end
  
  def listings
    @listings = Listing.all.where.not("listing_status LIKE ?", "deleted").paginate(page: params[:page])
  end

  def renobb
    @renolistings = Listing.where(zip_code: ['89512', '89431', '89503', '89501', '89509', '89523', '89434'])
                            .all.where.not("listing_status LIKE ?", "deleted").paginate(page: params[:page])
    @southlistings = Listing.where(zip_code: ['89519', '89502', '89511', '89521'])
                            .all.where.not("listing_status LIKE ?", "deleted").paginate(page: params[:page])
    @renobblistings = Listing.all.where(:renobb => true).where.not("listing_status LIKE ?" , "deleted").paginate(page: params[:page])
  end

end

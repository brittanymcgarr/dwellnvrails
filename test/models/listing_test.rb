require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:example)
    @listing = @user.listings.build(description: "Has a door. That's useful.", 
                                     street_address: "123 Place Street",
                                     city: "Reno",
                                     state: "NV",
                                     zip_code: "89511-1441",
                                     primary_contact: "(775)555-5555",
                                     secondary_contact: "775-555-5556",
                                     listing_status: "active",
                                     user_id: @user.id)
  end
  
  test "should be valid" do
    assert @listing.valid?
  end
  
  test "user id should be present" do
    @listing.user_id = nil
    assert_not @listing.valid?
  end
  
  test "order should be most recent first" do
    assert_equal listings(:most_recent), Listing.first
  end
  
end

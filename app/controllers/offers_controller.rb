class OffersController < ApplicationController

  def index 
    @offers = Offer.find_by_username(current_user.username)
  end
end

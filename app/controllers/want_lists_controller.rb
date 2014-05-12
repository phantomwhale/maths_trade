class WantListsController < ApplicationController
  def show
    offers = Offer.find_by_username(current_user.username)
    @formatter = WantListFormatter.new(current_user.username, offers)
  end
end

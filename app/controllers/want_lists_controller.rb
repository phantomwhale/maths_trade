class WantListsController < ApplicationController
  def show
    offers = Offer.find_by_username(current_user.username)
    wants = Want.where(:user => current_user).where('cash_offer > 0').order('list_entry_id')
    @formatter = WantListFormatter.new(current_user.username, offers, wants)
  end
end

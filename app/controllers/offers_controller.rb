class OffersController < ApplicationController

  def index 
    @offers = Bgg.geek_list.games_for_user(current_user.username)
  end
end

class GeekListsController < ApplicationController

  def show 
    geek_list = Bgg.geek_list(params[:id])
    @trade_list = TradeListPresenter.new(geek_list, current_user)
  end
end

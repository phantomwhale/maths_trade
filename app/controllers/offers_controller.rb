class OffersController < ApplicationController

  def index 
    @offers = load_offers
  end

  private

  def load_offers
    Bgg.geek_list.games_owned_by(current_user.username).map do |offer| 
      offer.extend(WithTrades)
      trade_row = TradeRow.find_by_offer_id(offer.list_entry_id)
      if trade_row
        offer.trades = trade_row.trade_ids.map do |trade_id|
          Bgg.geek_list.list_entry(trade_id)
        end
      end
      offer
    end
  end

  module WithTrades
    attr_accessor :trades
  end
end

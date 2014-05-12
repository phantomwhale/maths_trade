class Offer
  attr_accessor :list_entry

  delegate :game_id, :index, :name, :owner, :trade_code, :to => :list_entry

  def initialize(list_entry)
    @list_entry = list_entry
  end

  def self.find_by_username(username) 
    Bgg.geek_list.games_owned_by(username).map do |list_entry| 
      Offer.new(list_entry)
    end
  end

  def list_entry_id
    list_entry.list_entry_id
  end

  def trade_row
    @trade_row ||= TradeRow.find_by_offer_id(list_entry_id)
  end

  def trades 
    trade_row ? trade_row.trades : nil
  end
end

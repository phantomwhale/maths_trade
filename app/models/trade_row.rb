class TradeRow < ActiveRecord::Base
  validates :offer_id, presence: true
  validates :cash_offer, numericality: { only_integer: true, greater_than: 0, 
                                         unless: Proc.new { |trade_row| trade_row.cash_offer.nil? } }
  validates_uniqueness_of :offer_id
  #validate :must_have_one_trade

  def offer
    @offer ||= Bgg.geek_list.list_entry(offer_id)
  end

  def trades
    trades = trade_ids.map do |trade_id|
      Bgg.geek_list.list_entry(trade_id)
    end
    trades << CashTrade.new(cash_offer) if cash_offer.present?
    trades
  end

  private

  def must_have_one_trade
    errors.add(:base, "You must specify at least one item to trade for, or provide a cash offer") if trades.empty? 
  end
end

class CashTrade
  def initialize(cash_offer)
    @cash_offer = cash_offer
  end

  def name
    "Cash ($#{@cash_offer})"
  end

  def trade_code
    "$#{@cash_offer}"
  end
end


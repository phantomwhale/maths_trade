class WantListFormatter

  def initialize(username, offers)
    @username = username
    @offers = offers
  end

  def formatted_trades
    @offers.map do |offer|
      trade_codes = offer.trades.collect(&:trade_code).join(" ")
      "(#{@username}) #{offer.trade_code}: #{trade_codes}"
    end
  end
end

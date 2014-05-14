class WantListFormatter

  def initialize(username, offers, wants)
    @username = username
    @offers = offers
    @wants = wants
  end

  def formatted_trades
    @offers.map do |offer|
      trade_codes = offer.trades.collect(&:trade_code).join(" ") if offer.trades
      format_line(offer.trade_code, trade_codes)
    end + 
    @wants.map do |want|
      trade_code = want.trade_code
      format_line("$#{want.cash_offer}", trade_code)
    end
  end

  def trades
    formatted_trades.join("\n")
  end

  private 

  def format_line(offer_code, trade_codes)
    "(#{@username}) #{offer_code}: #{trade_codes}"
  end
end

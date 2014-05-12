class WantListFormatter

  def initialize(username, offers)
    @username = username
    @offers = offers
  end

  def formatted_trades
    @offers.map do |offer|
      "(#{@username}) #{offer.trade_code}:"
    end
  end
end

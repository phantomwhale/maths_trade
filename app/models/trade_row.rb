class TradeRow < ActiveRecord::Base
  validates :offer_id, :trade_ids, presence: true
  validates_uniqueness_of :offer_id

  def offer
    @offer ||= Bgg.geek_list.list_entry(offer_id)
  end
end
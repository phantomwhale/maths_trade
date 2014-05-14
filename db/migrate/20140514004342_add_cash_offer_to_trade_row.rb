class AddCashOfferToTradeRow < ActiveRecord::Migration
  def change
    add_column :trade_rows, :cash_offer, :integer
  end
end

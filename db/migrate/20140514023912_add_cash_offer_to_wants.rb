class AddCashOfferToWants < ActiveRecord::Migration
  def change
    add_column :wants, :cash_offer, :integer
  end
end

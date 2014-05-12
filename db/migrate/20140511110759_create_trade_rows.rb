class CreateTradeRows < ActiveRecord::Migration
  def change
    create_table :trade_rows do |t|
      t.integer :offer_id
      t.integer :trade_ids, array: true, default: []

      t.timestamps
    end
  end
end

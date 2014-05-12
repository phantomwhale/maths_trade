class TradeRowsController < ApplicationController

  def new 
    @wants = Want.where(:user => current_user).order('list_entry_id')
    @trade_row = TradeRow.new(offer_id: params[:offer_id])
  end

  def create
    TradeRow.create!(offer_id: params[:offer_id], trade_ids: params[:trade_row][:trade_ids])
    redirect_to offers_path
  end
end

class TradeRowsController < ApplicationController

  def new 
    @wants = Want.where(:user => current_user).order('list_entry_id')
    @trade_row = TradeRow.new(offer_id: params[:offer_id])
  end

  def create
    TradeRow.create!(offer_id: params[:offer_id], trade_ids: trade_ids) if trade_ids.present?
    redirect_to offers_path
  end

  def edit
    @wants = Want.where(:user => current_user).order('list_entry_id')
    @trade_row = TradeRow.find_by_offer_id(params[:offer_id])
  end

  def update
    trade_row = TradeRow.find_by_offer_id(params[:offer_id])
    if trade_ids.present?
      trade_row.trade_ids = trade_ids
      trade_row.save!
    else
      trade_row.destroy
    end
    redirect_to offers_path
  end

  def destroy
    trade_row = TradeRow.find_by_offer_id(params[:offer_id])
    trade_row.destroy
    redirect_to offers_path
  end

  private

  def trade_ids
    params[:trade_row] ? params[:trade_row][:trade_ids] : []
  end
end

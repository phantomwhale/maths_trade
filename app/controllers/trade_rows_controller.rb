class TradeRowsController < ApplicationController

  def edit
    load_wants
    @trade_row = TradeRow.find_or_create_by(offer_id: params[:offer_id])
  end

  def update
    @trade_row = TradeRow.find_by_offer_id(params[:offer_id])
    @trade_row.trade_ids = [] unless params[:trade_ids]
    if @trade_row.update_attributes(trade_row_params)
      redirect_to offers_path
    else
      load_wants
      render :edit
    end
  end

  def destroy
    trade_row = TradeRow.find_by_offer_id(params[:offer_id])
    trade_row.destroy
    redirect_to offers_path
  end

  private

  def load_wants
    @wants = Want.where(:user => current_user).order('position')
  end

  def trade_row_params
    params[:trade_row].permit(:cash_offer, :trade_ids => [])
  end
end

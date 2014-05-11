class WantsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wants = current_user.wants
  end

  def create
    Want.create!(user: current_user, 
                 game_id: params[:game_id], 
                 list_entry_id: params[:list_entry_id], 
                 seller: params[:seller])
    respond_to do |format|
      format.html { redirect_to trade_list_path(GeekList::AUSSIE_MID_YEAR_2014_ID), notice: "Added item #{params[:game_id]} to want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end

  def destroy
    Want.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to wants_path, notice: "Removed item #{params[:id]} from want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end
end
